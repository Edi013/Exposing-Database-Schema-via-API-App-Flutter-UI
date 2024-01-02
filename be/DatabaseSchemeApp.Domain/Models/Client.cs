namespace DatabaseSchemeApp.Domain.Models
{
    public partial class Client : BaseEntity
    {
        public Client()
        {
            Comenzi = new HashSet<Comanda>();
        }

        public string? Nume { get; set; }
        public string? Prenume { get; set; }
        public string? Companie { get; set; }
        public string? Adresa { get; set; }
        public string? Oras { get; set; }
        public string? Cod { get; set; }
        public string? Telefon { get; set; }

        public virtual ICollection<Comanda> Comenzi { get; set; }
    }
}
