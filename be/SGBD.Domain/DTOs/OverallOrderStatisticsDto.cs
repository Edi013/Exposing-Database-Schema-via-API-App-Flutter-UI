namespace SGBD.Domain.DTOs
{
    public class OverallOrderStatisticsDto
    {
        public int TotalOrders { get; set; }
        public int TotalItems { get; set; }
        public decimal OverallOrderValue { get; set; }
    }
}
