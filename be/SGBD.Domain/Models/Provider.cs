namespace SGBD.Domain.Models
{
    public partial class Provider : BaseEntity
    {
        public Provider()
        {
        }

        public decimal Id { get; set; }
        public string? ProviderName { get; set; }
        public decimal? ExecutionDuration { get; set; }
    }
}
