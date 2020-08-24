namespace MarketPlace.API.Models.Output
{
    public class AudioSystemOutputModel : ProductOutputModel
    {
        public decimal Power { get; set; }
        public decimal MemorySize { get; set; }
        public byte NumberOfModes { get; set; }
        public bool Jack { get; set; }
        public bool MiniJack { get; set; }
        public bool DiskDrivePresence { get; set; }
        public bool SmartHomeFunction { get; set; }
    }
}
