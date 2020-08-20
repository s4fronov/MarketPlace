namespace MarketPlace.API.Models.Output
{
    public class IronOutputModel
    {
        public decimal Power { get; set; }
        public decimal MaxTemperature { get; set; }
        public byte NumberOfModes { get; set; }
        public bool SteamGeneratorFunction { get; set; }
    }
}
