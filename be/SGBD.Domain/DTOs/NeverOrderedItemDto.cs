using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGBD.Domain.DTOs
{
    public class NeverOrderedItemDto
    {
        public decimal StorageLocationId { get; set; }
        public decimal ProviderId { get; set; }
        public decimal UnitPrice { get; set; }
        public string LocationName { get; set; }
        public string LocationDescription { get; set; }
    }
}
