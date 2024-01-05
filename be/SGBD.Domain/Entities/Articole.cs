namespace SGBD.Domain.Entities
{
    public partial class Articole : BaseEntity
    {
        public decimal? IdComenzi { get; set; }
        public decimal? IdStoc { get; set; }
        public decimal? Cantitate { get; set; }
        public decimal? PretTotal { get; set; }

        public virtual Comenzi? Order { get; set; }
        public virtual Stoc? StorageLocation { get; set; }
    }
}
