namespace MarketPlace.API.Models.Output
{
    public class CameraOutputModel
    {
        public decimal BatteryCapacity { get; set; }
        public decimal MemorySize { get; set; }
        public decimal ScreenDiagonal { get; set; }
        public short ScreenResolutionWidth { get; set; }
        public short ScreenResolutionHeight { get; set; }
        public byte NumberOfModes { get; set; }
        public bool HDMI { get; set; }
        public bool SmartHomeFunction { get; set; }
        public bool CameraFunction { get; set; }
    }
}
