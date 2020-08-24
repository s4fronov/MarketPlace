namespace MarketPlace.API.Models.Output
{
    public class ProductOutputModel
    {
        public long? Id { get; set; }
        public string Category { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public decimal Price { get; set; }
        public decimal Width { get; set; }
        public decimal Height { get; set; }
        public decimal Length { get; set; }
        public decimal Weight { get; set; }
        public short ProdYear { get; set; }
        public short? Warranty { get; set; }
    }
}
