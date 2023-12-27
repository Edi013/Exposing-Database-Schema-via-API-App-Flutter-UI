namespace DatabaseSchemeApp.Domain.Entities
{
    public class Comanda
    {
        public int IdComanda { get; set; }
        public int IdClient { get; set; }
        public DateTime DataComanda { get; set; }
        public DateTime DataOnorare { get; set; }
        public DateTime DataPlatii { get; set; }

        public Client Client { get; set; }
    }
}
