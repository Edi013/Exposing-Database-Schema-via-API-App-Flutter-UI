namespace DatabaseSchemeApp.Domain.Entities
{
    public class Articol
    {
        public int IdArticol { get; set; }
        public int IdComanda { get; set; }
        public int IdStoc { get; set; }
        public int Cantitate { get; set; }
        public float PretTotal { get; set; }

        public Comanda Comanda { get; set; }
        public Stoc Stoc { get; set; }
    }
}
