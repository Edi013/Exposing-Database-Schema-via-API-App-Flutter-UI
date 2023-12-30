namespace DatabaseSchemeApp.Domain.Entities
{
    public class Comanda : BaseEntity
    {
        public int IdClient { get; set; }
        public Client Client { get; set; }
        public DateTime DataComanda { get; set; }
        public DateTime DataOnorare { get; set; }
        public DateTime DataPlatii { get; set; }

    }
}
