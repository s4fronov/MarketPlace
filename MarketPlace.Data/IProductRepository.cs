using MarketPlace.Data.DTO;

namespace MarketPlace.Data
{
    public interface IProductRepository
    {
        public DataWrapper<ProductDto> GetAllProducts();
    }
}