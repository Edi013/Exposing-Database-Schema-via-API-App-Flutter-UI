namespace DatabaseSchemeApp.Domain.Entities
{
    public class Articol : BaseEntity
    {
        public int IdComanda { get; set; }
        public Comanda Comanda { get; set; }
        public int IdStoc { get; set; }
        public Stoc Stoc { get; set; }
        public int Cantitate { get; set; }
        public float PretTotal { get; set; }

    }
}
