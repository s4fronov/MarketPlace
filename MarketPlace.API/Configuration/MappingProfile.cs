using AutoMapper;
using MarketPlace.API.Models.Output;
using MarketPlace.Data.DTO;

namespace MarketPlace.API.Configuration
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ProductDto, ProductOutputModel>();
        }
    }
}
