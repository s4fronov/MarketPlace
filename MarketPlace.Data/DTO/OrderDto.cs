using System;
using System.Collections.Generic;

namespace MarketPlace.Data.DTO
{
    public class OrderDto
    {
        public long? Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Patronymic { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int CityId { get; set; }
        public string Address { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime DeliveryDate { get; set; }
        public bool IsDelivered { get; set; }
        public List<ProductsInOrderDto> Products { get; set; }
    }
}
