using MarketPlace.Data.DTO;

namespace MarketPlace.Data
{
    public interface IOrderRepository
    {
        DataWrapper<OrderDto> CreateOrder(OrderDto orderDto);
        void AddProductsInOrder(ProductsInOrderDto products);
        DataWrapper<OrderDto> GetProductsInOrderByOrderId(long id);
    }
}