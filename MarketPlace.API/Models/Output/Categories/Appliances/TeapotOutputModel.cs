namespace MarketPlace.API.Models.Output
{
    public class TeapotOutputModel : ProductOutputModel
    {
        public decimal Volume { get; set; }
        public decimal Power { get; set; }
        public bool SmartHomeFunction { get; set; }
    }
}
