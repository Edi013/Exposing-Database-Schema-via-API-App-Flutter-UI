namespace DatabaseSchemeApp.Domain
{
    public class Articol
    {
        public int IdArticol { get; set; }
        public int IdComanda { get; set; }
        public int IdStoc { get; set; }
        public int Cantitate { get; set; }
        public decimal PretTotal { get; set; }

        public Comanda Comanda { get; set; }
        public Stoc Stoc { get; set; }
    }
}
