using AutoMapper;
using MarketPlace.API.Models.Input;
using MarketPlace.API.Models.Output;
using MarketPlace.Data.DTO;
using MarketPlace.Core;
using System;

namespace MarketPlace.API.Configuration
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ProductDto, ProductOutputModel>();
            CreateMap<ProductInputModel, ProductDto>();

            CreateMap<ProductDto, RefrigeratorOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, StoveOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, OvenOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, MicrowaveOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, MulticookerOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, TeapotOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, IronOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, VacuumCleanerOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, RobotVacuumCleanerOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, AirConditioningOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, TelevisionOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, MonitorOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, AudioSystemOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, SmartphoneOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, TabletOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, NotebookOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));
            CreateMap<ProductDto, CameraOutputModel>()
                .ForMember(dest => dest.Category, o => o.MapFrom(src => Enum.GetName(typeof(Category), src.CategoryId)));

            CreateMap<OrderInputModel, OrderDto>()
                .ForPath(dest => dest.Products, o => o.MapFrom(src => src.Products));
            CreateMap<ProductsInOrderOutputModel, ProductsInOrderDto>();

            CreateMap<OrderDto, OrderOutputModel>()
                .ForPath(dest => dest.Products, o => o.MapFrom(src => src.Products))
                .ForMember(dest => dest.CityId, o => o.MapFrom(src => Enum.GetName(typeof(City), src.CityId)))
                .ForPath(dest => dest.OrderDate, o => o.MapFrom(src => src.OrderDate.ToString("dd.MM.yyyy HH:mm:ss")))
                .ForPath(dest => dest.DeliveryDate, o => o.MapFrom(src => src.DeliveryDate.ToString("dd.MM.yyyy HH:mm:ss")));
            CreateMap<ProductsInOrderDto, ProductsInOrderOutputModel>()
                .ForPath(dest => dest.Name, o => o.MapFrom(src => src.Product.Name))
                .ForPath(dest => dest.Price, o => o.MapFrom(src => src.Product.Price));
        }
    }
}
