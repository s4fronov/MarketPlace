namespace MarketPlace.API.Models.Output
{
    public class TabletOutputModel : ProductOutputModel
    {
        public decimal BatteryCapacity { get; set; }
        public decimal MemorySize { get; set; }
        public decimal ScreenDiagonal { get; set; }
        public short ScreenResolutionWidth { get; set; }
        public short ScreenResolutionHeight { get; set; }
        public bool MiniJack { get; set; }
        public bool LTE { get; set; }
        public bool TabletMode { get; set; }
        public bool CameraFunction { get; set; }
    }
}
