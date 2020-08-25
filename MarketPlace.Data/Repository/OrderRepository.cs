using MarketPlace.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using MarketPlace.Core;
using Dapper;
using System.Linq;

namespace MarketPlace.Data
{
    public class OrderRepository : IOrderRepository
    {
        private readonly IDbConnection _connection;

        public OrderRepository(IOptions<StorageOptions> options)
        {
            _connection = new SqlConnection(options.Value.DBConnectionString);
        }

        public DataWrapper<OrderDto> GetOrderById(long orderId)
        {
            var orderDictionary = new Dictionary<long, OrderDto>();
            var result = new DataWrapper<OrderDto>();
            try
            {
                result.Data = _connection.Query<OrderDto, ProductsInOrderDto, ProductDto, OrderDto>(
                    StoredProcedures.GetProductsInOrderByOrderId,
                    (order, product, products) =>
                    {
                        OrderDto orderEntry;
                        if (!orderDictionary.TryGetValue(order.Id.Value, out orderEntry))
                        {
                            orderEntry = order;
                            orderEntry.Products = new List<ProductsInOrderDto>();
                            orderDictionary.Add(orderEntry.Id.Value, orderEntry);
                        }
                        product.Product = products;
                        product.Product.Name = products.Name;
                        product.Product.Price = products.Price;
                        orderEntry.Products.Add(product);
                        return orderEntry;
                    },
                    new { orderId },
                    splitOn: "ProductId, Name",
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<long> AddOrderInformation(OrderDto orderDto)
        {
            var result = new DataWrapper<long>();
            try
            {
                result.Data = _connection.Query<long>(StoredProcedures.OrderAdd,
                    new
                    {
                        orderDto.FirstName,
                        orderDto.LastName,
                        orderDto.Patronymic,
                        orderDto.Email,
                        orderDto.Phone,
                        orderDto.CityId,
                        orderDto.Address
                    },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<OrderDto> CreateOrder(OrderDto orderDto) {
            var result = new DataWrapper<OrderDto>();
            try
            {
                orderDto.Id = AddOrderInformation(orderDto).Data;
                foreach (var product in orderDto.Products)
                {
                    product.OrderId = orderDto.Id;
                    AddProductsInOrder(product);
                }
                result.Data = GetOrderById(orderDto.Id.Value).Data;
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public void AddProductsInOrder(ProductsInOrderDto products)
        {
            _connection.Execute(StoredProcedures.AddProductInOrder,
                    new
                    {
                        products.OrderId,
                        products.ProductId,
                        products.Quantity
                    },
                    commandType: CommandType.StoredProcedure);
        }
    }
}
