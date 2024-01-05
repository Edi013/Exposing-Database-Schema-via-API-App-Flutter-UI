namespace SGBD.Domain.Entities
{
    public partial class Furnizori : BaseEntity
    {
        public Furnizori()
        {
        }

        public string? NumeFurnizori { get; set; }
        public decimal? TimpExecutie { get; set; }
    }
}
