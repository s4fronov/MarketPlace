namespace MarketPlace.API.Models.Output
{
    public class VacuumCleanerOutputModel
    {
        public decimal Volume { get; set; }
        public decimal Power { get; set; }
        public byte NumberOfModes { get; set; }
        public bool WetCleaningFunction { get; set; }
    }
}
