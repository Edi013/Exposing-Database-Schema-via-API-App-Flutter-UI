using Microsoft.EntityFrameworkCore;
using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class OrderRepository : RepositoryBase<Comenzi>, IOrderRepository
    {
        public OrderRepository(ApplicationDbContext context)
            : base(context)
        { }

        // Cerinte suplimentare
        // 1
        public async Task<IQueryable<ContextComandaDto>> GetOrderStatiGetEachOrderStatistics()
        {
            var query = from comanda in context.TabelaComenzi
                        join articol in context.TabelaArticole on comanda.Id equals articol.IdComenzi into articoleComandate
                        from oi in articoleComandate.DefaultIfEmpty()
                        group oi by new { comanda.Id } into grupare
                        select new ContextComandaDto
                        {
                            OrderId = grupare.Key.Id,
                            ItemsCount = grupare.Count(),
                            OrderValue = (decimal)grupare.Sum(articol => articol.PretTotal)
                        };

            return await Task.FromResult(query.AsQueryable());
        }

        // 2
        public async Task<ContextComenziDto> GetOverallOrderStatistics()
        {

            var result = await context.TabelaComenzi
                .Select(comanda => new
                {
                    OrdersCount = context.TabelaComenzi.Count(),
                    TotalItems = context.TabelaArticole.Count(),
                    OverallOrderValue = context.TabelaArticole.Sum(articol => articol.PretTotal) ?? 0
                })
                .FirstOrDefaultAsync();

            return new ContextComenziDto
            {
                NumarComenzi = result.OrdersCount,
                NumarArticole = result?.TotalItems ?? 0,
                ValoareTotala = result?.OverallOrderValue ?? 0
            };
        }

        // 3
        public async Task<IEnumerable<ArticoleComandateNiciodataDto>> GetNeverOrderedItems()
        {
            var neverOrderedItems = await context.TabelaStocuri
                .Where(sl => !context.TabelaArticole.Select(articol => articol.IdStoc).Contains(sl.Id))
              .Select(sl => new ArticoleComandateNiciodataDto
              {
                  IdStoc = sl.Id,
                  DescriereUnitate = sl.DescriereUnitate,
                  NumeUnitate = sl.Unitate,
                  IdFurnizori = (decimal)sl.IdFurnizori,
                  PretUnitar = (decimal)sl.PretUnitar,
              })
              .ToListAsync();
            return neverOrderedItems;
        }
    }
}
