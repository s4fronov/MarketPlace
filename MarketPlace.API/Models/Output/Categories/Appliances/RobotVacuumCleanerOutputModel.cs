namespace MarketPlace.API.Models.Output
{
    public class RobotVacuumCleanerOutputModel : ProductOutputModel
    {
        public decimal Volume { get; set; }
        public decimal Power { get; set; }
        public decimal BatteryCapacity { get; set; }
        public byte NumberOfModes { get; set; }
        public bool SmartHomeFunction { get; set; }
        public bool WetCleaningFunction { get; set; }
    }
}
