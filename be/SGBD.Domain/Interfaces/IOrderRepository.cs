using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;

namespace SGBD.Domain.Interfaces
{
    public interface IOrderRepository : IRepository<Comenzi>
    {
        Task<IQueryable<ContextComandaDto>> GetOrderStatiGetEachOrderStatistics();
        Task<ContextComenziDto> GetOverallOrderStatistics();
        Task<IEnumerable<ArticoleComandateNiciodataDto>> GetNeverOrderedItems();

    }
}
