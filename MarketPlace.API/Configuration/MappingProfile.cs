using AutoMapper;
using MarketPlace.API.Models.Input;
using MarketPlace.API.Models.Output;
using MarketPlace.Data.DTO;
using MarketPlace.Core;

namespace MarketPlace.API.Configuration
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ProductDto, ProductOutputModel>();
            CreateMap<ProductInputModel, ProductDto>();

            
        }
    }
}
