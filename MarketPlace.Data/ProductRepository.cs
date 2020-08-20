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

        public DataWrapper<ProductDto> GetAllProducts()
        {
            var result = new DataWrapper<ProductDto>();
            try
            {
                result.Data = _connection.Query<ProductDto>(
                    StoredProcedures.ProductsGetAll,
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
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
