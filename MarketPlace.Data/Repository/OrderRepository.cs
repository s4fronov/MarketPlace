using MarketPlace.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace MarketPlace.Data
{
    public class OrderRepository : IOrderRepository
    {
        public DataWrapper<OrderDto> CreateOrder(OrderDto orderDto) { return null; }
        public void AddProductsInOrder(ProductsInOrderDto products) { }
        public DataWrapper<OrderDto> GetProductsInOrderByOrderId(long id) { return null; }
    }
}
