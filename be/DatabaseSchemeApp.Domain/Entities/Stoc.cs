namespace DatabaseSchemeApp.Domain.Entities
{
    public class Stoc
    {
        public int IdStoc { get; set; }
        public int IdFurnizor { get; set; }
        public string Descriere { get; set; }
        public float PretUnitar { get; set; }
        public string Unitate { get; set; }
        public string DescriereUnitate { get; set; }

        public Furnizor Furnizor { get; set; }
    }
}
