namespace SGBD.Domain.Entities
{
    public partial class Stoc : BaseEntity
    {
        public Stoc()
        {
        }

        public decimal? IdFurnizori { get; set; }
        public decimal? PretUnitar { get; set; }
        public string? Descriere { get; set; }
        public string? Unitate { get; set; }
        public string? DescriereUnitate { get; set; }
    }
}
