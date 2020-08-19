using AutoMapper;
using MarketPlace.API.Models.Output;
using MarketPlace.Data;
using MarketPlace.Data.DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace MarketPlace.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class GoodsController : Controller
    {        
        private readonly ILogger<GoodsController> _logger;
        private readonly IGoodsRepository _repo;
        private readonly IMapper _mapper;
        private delegate T DtoConverter<T, K>(K dto);

        public GoodsController(ILogger<GoodsController> logger, IGoodsRepository repo, IMapper mapper)
        {
            _logger = logger;
            _repo = repo;
            _mapper = mapper;
        }
       
        /// <summary>
        /// Gets all appliances with short info
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult<GoodsOutputModel> GetAllGoods()
        {
            DataWrapper<GoodsDto> dataWrapper = _repo.GetAllGoods();
            return MakeResponse(dataWrapper, _mapper.Map<GoodsOutputModel>);
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
