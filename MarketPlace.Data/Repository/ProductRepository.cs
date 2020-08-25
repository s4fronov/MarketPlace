using Dapper;
using MarketPlace.Core;
using MarketPlace.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace MarketPlace.Data
{
    public class ProductRepository : IProductRepository
    {
        private readonly IDbConnection _connection;
        private readonly Categorization categorization;

        public ProductRepository(IOptions<StorageOptions> options)
        {
            _connection = new SqlConnection(options.Value.DBConnectionString);
            categorization = new Categorization();
        }

        public DataWrapper<List<ProductDto>> GetAllProducts()
        {
            var result = new DataWrapper<List<ProductDto>>();
            try
            {
                var allProducts = _connection.Query<ProductDto>(StoredProcedures.ProductGetAll).ToList();
                result.Data = categorization.AddCategoriesToProducts(allProducts);
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<ProductDto> AddProduct(ProductDto productDto) 
        {
            var result = new DataWrapper<ProductDto>();
            try
            {
                var product = _connection.Query<ProductDto>(StoredProcedures.ProductAdd, productDto, commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.Data = categorization.AddCategoriesToProducts(new List<ProductDto>() { product }).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<ProductDto> GetProductById(int id) 
        {
            var result = new DataWrapper<ProductDto>();
            try
            {
                var product = _connection.Query<ProductDto>(
                    StoredProcedures.ProductGetById, new { id }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.Data = categorization.AddCategoriesToProducts(new List<ProductDto>() { product }).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<ProductDto> UpdatePriceByProductId(int Id, decimal? price) 
        {
            var result = new DataWrapper<ProductDto>();
            try
            {
                var product = _connection.Query<ProductDto>(StoredProcedures.ProductUpdatePrice, new { Id, price }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.Data = categorization.AddCategoriesToProducts(new List<ProductDto>() { product }).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<int> GetProductByName(string model) 
        {
            var result = new DataWrapper<int>();
            try
            {
                result.Data = _connection.Query<int>(StoredProcedures.ProductFindByName, new { model }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }
    }
}
