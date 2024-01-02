namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Comanda : BaseEntity
    {
        public Comanda()
        {
        }

        public int? IdClienti { get; set; }
        public DateTime? DataComenzi { get; set; }
        public DateTime? DataOnorare { get; set; }
        public DateTime? DataPlatii { get; set; }

        public virtual Client? IdClientiNavigation { get; set; }
    }
}
