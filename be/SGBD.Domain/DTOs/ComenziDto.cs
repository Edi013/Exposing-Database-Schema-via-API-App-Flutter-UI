using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGBD.Domain.DTOs
{
    public class ComenziDto
    {
        public decimal? Id { get; set; }
        public decimal? IdClienti { get; set; }
        public string? DataPlasare { get; set; }
        public string? DataOnorare { get; set; }
        public string? DataPlata { get; set; }
    }
}
