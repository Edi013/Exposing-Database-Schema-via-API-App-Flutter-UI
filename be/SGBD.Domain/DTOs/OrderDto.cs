using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGBD.Domain.DTOs
{
    public class OrderDto
    {
        public decimal? Id { get; set; }
        public decimal? ClientId { get; set; }
        public string? OrderDate { get; set; }
        public string? DeliveryDate { get; set; }
        public string? PayDate { get; set; }
    }
}
