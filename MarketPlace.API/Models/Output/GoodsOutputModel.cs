﻿namespace MarketPlace.API.Models.Output
{
    public class GoodsOutputModel
    {
		public int Id { get; set; }
		public string Model { get; set; }
		public string Company { get; set; }
		public string Country { get; set; }
		public int ProductionYear { get; set; }
		public decimal Price { get; set; }		
	}
}
