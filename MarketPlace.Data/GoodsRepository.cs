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
    public class GoodsRepository : IGoodsRepository
    {
        private readonly IDbConnection _connection;

        public GoodsRepository(IOptions<StorageOptions> options)
        {
            _connection = new SqlConnection(options.Value.DBConnectionString);
        }

        public DataWrapper<GoodsDto> GetAccountById(long Id)
        {
            var result = new DataWrapper<GoodsDto>();
            try
            {
                result.Data = _connection.Query<GoodsDto>(
                    StoredProcedures.GoodsGetById, new { Id },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();
                result.IsOk = true;
            }
            catch (Exception e)
            {
                result.ExceptionMessage = e.Message;
            }
            return result;
        }

        public DataWrapper<GoodsDto> GetAllGoods()
        {
            throw new NotImplementedException();
        }
    }
}
