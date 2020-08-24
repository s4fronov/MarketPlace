namespace MarketPlace.Data.DTO
{
    public class ProductDto
    {
        public long? Id { get; set; }
        public int? CategoryId { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public decimal Price { get; set; }
        public decimal Width { get; set; }
        public decimal Height { get; set; }
        public decimal Length { get; set; }
        public decimal Weight { get; set; }
        public short ProdYear { get; set; }
        public short? Warranty { get; set; }
        public decimal? Volume { get; set; }
        public decimal? Power { get; set; }
        public decimal? MaxTemperature { get; set; }
        public decimal? BatteryCapacity { get; set; }
        public decimal? MemorySize { get; set; }
        public decimal? ScreenDiagonal { get; set; }
        public short? ScreenResolutionWidth { get; set; }
        public short? ScreenResolutionHeight { get; set; }
        public byte? NumberOfModes { get; set; }
        public bool? HDMI { get; set; }
        public bool? Jack { get; set; }
        public bool? MiniJack { get; set; }
        public bool? LTE { get; set; }
        public bool? TabletMode { get; set; }
        public bool? DiskDrivePresence { get; set; }
        public bool? SmartHomeFunction { get; set; }
        public bool? SteamGeneratorFunction { get; set; }
        public bool? WetCleaningFunction { get; set; }
        public bool? QuickDefrostFunction { get; set; }
        public bool? CameraFunction { get; set; }
        public bool? TvFunction { get; set; }
        public bool? GrillFunction { get; set; }
    }
}
