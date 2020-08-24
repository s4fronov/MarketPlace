namespace MarketPlace.API.Models.Output
{
    public class NotebookOutputModel : ProductOutputModel
    {
        public decimal Power { get; set; }
        public decimal BatteryCapacity { get; set; }
        public decimal MemorySize { get; set; }
        public decimal ScreenDiagonal { get; set; }
        public short ScreenResolutionWidth { get; set; }
        public short ScreenResolutionHeight { get; set; }
        public bool HDMI { get; set; }
        public bool MiniJack { get; set; }
        public bool TabletMode { get; set; }
        public bool DiskDrivePresence { get; set; }
        public bool CameraFunction { get; set; }
    }
}
