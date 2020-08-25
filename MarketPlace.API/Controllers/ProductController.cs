using AutoMapper;
using MarketPlace.API.Models.Output;
using MarketPlace.Data;
using MarketPlace.Data.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace MarketPlace.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : Controller
    {        
        private readonly IProductRepository _repo;
        private readonly IMapper _mapper;
        private delegate T DtoConverter<T, K>(K dto);

        public ProductController(IProductRepository repo, IMapper mapper)
        {
            _repo = repo;
            _mapper = mapper;
        }

        /// <summary>
        /// Gets product by Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [ProducesResponseType(StatusCodes.Status200OK)]
        [HttpGet("{id}")]
        public ActionResult<ProductOutputModel> GetProductById(int id)
        {
            var dataWrapper = _repo.GetProductById(id);
            return MakeResponse(dataWrapper, _mapper.Map<ProductOutputModel>);
        }

        /// <summary>
        /// Gets all appliances with short info
        /// </summary>
        /// <returns></returns>
        [ProducesResponseType(StatusCodes.Status200OK)]
        [HttpGet]
        public ActionResult<List<ProductOutputModel>> GetAllProducts()
        {
            var dataWrapper = _repo.GetAllProducts();
            return MakeResponse(dataWrapper, _mapper.Map <List<ProductOutputModel>>);
        }

        private ActionResult<T> MakeResponse<T>(DataWrapper<T> dataWrapper)
        {
            if (!dataWrapper.IsOk)
            {
                return BadRequest(dataWrapper.ExceptionMessage);
            }
            return Ok(dataWrapper.Data);
        }

        private ActionResult<T> MakeResponse<T, K>(DataWrapper<K> dataWrapper, DtoConverter<T, K> dtoConverter)
        {
            if (!dataWrapper.IsOk)
            {
                return BadRequest(dataWrapper.ExceptionMessage);
            }
            return Ok(dtoConverter(dataWrapper.Data));
        }
    }
}
