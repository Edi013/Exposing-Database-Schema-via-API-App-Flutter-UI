namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Furnizor : BaseEntity
    {
        public Furnizor()
        {
            Stocuri = new HashSet<Stoc>();
        }

        public string? NumeFurnizori { get; set; }
        public decimal? TimpExecutie { get; set; }

        public virtual ICollection<Stoc> Stocuri { get; set; }
    }
}
