namespace MarketPlace.API.Models.Output
{
    public class ProductsInOrderOutputModel
    {
        public long ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public byte Quantity { get; set; }
        public decimal Amount { get; set; }
    }
}
