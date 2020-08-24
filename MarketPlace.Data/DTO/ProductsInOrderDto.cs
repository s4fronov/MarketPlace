namespace MarketPlace.Data.DTO
{
    public class ProductsInOrderDto
    {
        public long? Id { get; set; }
        public long? OrderId { get; set; }
        public int ProductId { get; set; }
        public byte Quantity { get; set; }
        public decimal Amount { get; set; }
        public ProductDto Product { get; set; }
    }
}
