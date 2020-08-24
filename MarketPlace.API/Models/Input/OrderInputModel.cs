using System.Collections.Generic;

namespace MarketPlace.API.Models.Input
{
    public class OrderInputModel
    {
        public long? Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Patronymic { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int CityId { get; set; }
        public string Address { get; set; }
        public List<ProductsToPutInOrder> Products { get; set; }
    }
    public class ProductsToPutInOrder
    {
        public long ProductId { get; set; }
        public byte Quantity { get; set; }
    }
}
