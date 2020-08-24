namespace MarketPlace.API.Models.Output
{
    public class MonitorOutputModel : ProductOutputModel
    {
        public decimal Power { get; set; }
        public decimal ScreenDiagonal { get; set; }
        public short ScreenResolutionWidth { get; set; }
        public short ScreenResolutionHeight { get; set; }
        public bool HDMI { get; set; }
        public bool MiniJack { get; set; }
        public bool CameraFunction { get; set; }
        public bool TvFunction { get; set; }
    }
}
