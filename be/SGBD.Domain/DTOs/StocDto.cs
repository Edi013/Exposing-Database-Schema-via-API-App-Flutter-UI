namespace SGBD.Domain.DTOs
{
    public class StocDto
    {
        public decimal Id { get; set; }
        public decimal? IdFurnizori { get; set; }
        public string? NumeLocatie { get; set; }
        public string? DescriereLocatie { get; set; }
        public decimal? PretUnitar { get; set; }
        public string? Descriere { get; set; }
    }
}
