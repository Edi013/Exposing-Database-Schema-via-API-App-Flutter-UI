namespace SGBD.Domain.Entities
{
    public partial class Comenzi : BaseEntity
    {
        public Comenzi()
        {
        }

        public decimal? IdClienti { get; set; }
        public DateTime? DataPlasare { get; set; }
        public DateTime? DataOnorare { get; set; }
        public DateTime? DataPlata { get; set; }

        public virtual Clienti? Client { get; set; }
    }
}
