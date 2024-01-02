namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Stoc : BaseEntity
    {
        public Stoc()
        {
        }

        public int? IdFurnizori { get; set; }
        public string? Descriere { get; set; }
        public decimal? PretUnitar { get; set; }
        public string? Unitate { get; set; }
        public string? DescriereUnitate { get; set; }

        public virtual Furnizor? IdFurnizoriNavigation { get; set; }
    }
}
