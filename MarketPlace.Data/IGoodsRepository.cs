using MarketPlace.Data.DTO;

namespace MarketPlace.Data
{
    public interface IGoodsRepository
    {
        public DataWrapper<GoodsDto> GetAllGoods();
    }
}