namespace MarketPlace.API.Models.Input
{
    public class ProductInputModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Manufacturer { get; set; }
        public decimal Price { get; set; }
        public decimal Width { get; set; }
        public decimal Height { get; set; }
        public decimal Length { get; set; }
        public decimal Weight { get; set; }
        public string Prod_Year { get; set; }
        public string? Warranty { get; set; }
        public decimal? Volume { get; set; }
        public decimal? Power { get; set; }
        public decimal? Max_temperature { get; set; }
        public decimal? Battery_capacity { get; set; }
        public decimal? Memory_size { get; set; }
        public bool? Disk_drive_presence { get; set; }
        public decimal? Screen_diagonal { get; set; }
        public int? Screen_resolution_width { get; set; }
        public int? Screen_resolution_height { get; set; }
        public int? Number_of_modes { get; set; }
        public bool? USB { get; set; }
        public bool? HDMI { get; set; }
        public bool? Jack { get; set; }
        public bool? MiniJack { get; set; }
        public bool? LTE { get; set; }
        public bool? Tablet_mode { get; set; }
        public bool? Smart_home_function { get; set; }
        public bool? Steam_generator_function { get; set; }
        public bool? Wet_cleaning_function { get; set; }
        public bool? Quick_defrost_function { get; set; }
        public bool? Camera_function { get; set; }
        public bool? TV_function { get; set; }
        public bool? Grill_function { get; set; }
    }
}
