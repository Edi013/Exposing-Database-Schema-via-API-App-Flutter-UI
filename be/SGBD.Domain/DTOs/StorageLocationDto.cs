namespace SGBD.Domain.DTOs
{
    public class StorageLocationDto
    {
        public decimal Id { get; set; }
        public decimal? ProviderId { get; set; }
        public decimal? UnitPrice { get; set; }
        public string? LocationName { get; set; }
        public string? LocationDescription { get; set; }
    }
}
