namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Articol : BaseEntity
    {
        public int? IdComanda { get; set; }
        public int? IdStoc { get; set; }
        public decimal? Cantitate { get; set; }
        public decimal? PretTotal { get; set; }

        public virtual Comanda? IdComandaNavigation { get; set; }
        public virtual Stoc? IdStocNavigation { get; set; }
    }
}
