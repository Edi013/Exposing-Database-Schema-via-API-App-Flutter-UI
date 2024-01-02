namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Furnizor : BaseEntity
    {
        public Furnizor()
        {
        }

        public string? NumeFurnizori { get; set; }
        public decimal? TimpExecutie { get; set; }

    }
}
