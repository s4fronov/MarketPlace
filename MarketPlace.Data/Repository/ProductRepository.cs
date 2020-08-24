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

        public ProductRepository(IOptions<StorageOptions> options)
        {
            _connection = new SqlConnection(options.Value.DBConnectionString);
        }

        public DataWrapper<List<ProductDto>> GetAllProducts()
        { return null; }

        public DataWrapper<ProductDto> AddProduct(ProductDto appliancesDto) 
        { return null; }

        public DataWrapper<ProductDto> GetProductById(int id) 
        { return null; }

        //public DataWrapper<List<ProductDto>> GetProductsByCategoryId(byte categoryId) { return null; }

        public DataWrapper<ProductDto> UpdatePriceByProductId(int Id, decimal? price) 
        { return null; }

        public DataWrapper<int> GetInfoAboutProductByName(string model) 
        { return null; }
    }
}
