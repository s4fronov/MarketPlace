using MarketPlace.Data.DTO;
using System.Collections.Generic;

namespace MarketPlace.Data
{
    public interface IProductRepository
    {
        DataWrapper<ProductDto> AddProduct(ProductDto appliancesDto); 
        DataWrapper<List<ProductDto>> GetAllProducts();
        DataWrapper<ProductDto> GetProductById(int id);
        //DataWrapper<List<ProductDto>> GetProductsByCategoryId(byte categoryId);
        DataWrapper<ProductDto> UpdatePriceByProductId(int Id, decimal? price);
        DataWrapper<int> GetProductByName(string model);
    }
}