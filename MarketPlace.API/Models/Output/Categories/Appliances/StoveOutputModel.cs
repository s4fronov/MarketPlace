namespace MarketPlace.API.Models.Output
{
    public class StoveOutputModel : ProductOutputModel
    {
        public decimal Volume { get; set; }
        public decimal Power { get; set; }
        public decimal MaxTemperature { get; set; }
        public byte NumberOfModes { get; set; }
    }
}
