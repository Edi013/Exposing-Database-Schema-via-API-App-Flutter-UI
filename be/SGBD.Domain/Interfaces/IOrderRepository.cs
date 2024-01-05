using SGBD.Domain.DTOs;
using SGBD.Domain.Models;

namespace SGBD.Domain.Interfaces
{
    public interface IOrderRepository : IRepository<Order>
    {
        Task<IQueryable<EachOrderDto>> GetOrderStatiGetEachOrderStatistics();
        Task<OverallOrderStatisticsDto> GetOverallOrderStatistics();
        Task<IEnumerable<NeverOrderedItemDto>> GetNeverOrderedItems();

    }
}
