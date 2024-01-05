namespace SGBD.Domain.DTOs
{
    public class ItemDto
    {
        public decimal Id { get; set; }
        public decimal? OrderId { get; set; }
        public decimal? StorageLocationId { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? TotalPrice { get; set; }
    }
}
