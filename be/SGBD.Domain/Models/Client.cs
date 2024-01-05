namespace SGBD.Domain.Models
{
    public partial class Client : BaseEntity
    {
        public Client()
        {
        }

        public string? LastName { get; set; }
        public string? FirstName { get; set; }
        public string? Company { get; set; }
        public string? Adress { get; set; }
        public string? City { get; set; }
        public string? PostalCode { get; set; }
        public string? PhoneNumber { get; set; }
    }
}
