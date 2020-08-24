namespace MarketPlace.API.Models.Output
{
    public class RefrigeratorOutputModel : ProductOutputModel
    {
        public decimal Volume { get; set; }
        public decimal Power { get; set; }
        public byte NumberOfModes { get; set; }
        public bool SmartHomeFunction { get; set; }
        public bool QuickDefrostFunction { get; set; }
    }
}
