using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;

namespace SGBD.Domain.Interfaces
{
    public interface IOrderRepository : IRepository<Comenzi>
    {
        Task<IQueryable<EachOrderDto>> GetOrderStatiGetEachOrderStatistics();
        Task<OverallOrderStatisticsDto> GetOverallOrderStatistics();
        Task<IEnumerable<NeverOrderedItemDto>> GetNeverOrderedItems();

    }
}
