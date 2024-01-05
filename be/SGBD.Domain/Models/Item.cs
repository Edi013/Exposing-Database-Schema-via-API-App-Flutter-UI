namespace SGBD.Domain.Models
{
    public partial class Item : BaseEntity
    {
        public decimal? OrderId { get; set; }
        public decimal? StorageLocationId { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? TotalPrice { get; set; }

        public virtual Order? Order { get; set; }
        public virtual StorageLocation? StorageLocation { get; set; }
    }
}
