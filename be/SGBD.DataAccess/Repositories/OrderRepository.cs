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

        // 3.1 Number of orders, number of items, and total value of orders and items
        public async Task<IQueryable<EachOrderDto>> GetOrderStatiGetEachOrderStatistics()
        {
            var query = from order in context.Orders
                        join item in context.Items on order.Id equals item.OrderId into orderItems
                        from oi in orderItems.DefaultIfEmpty()
                        group oi by new { order.Id } into grouped
                        select new EachOrderDto
                        {
                            OrderId = grouped.Key.Id,
                            ItemsCount = grouped.Count(),
                            OrderValue = (decimal)grouped.Sum(item => item.TotalPrice)
                        };

            return await Task.FromResult(query.AsQueryable());
        }

        // 3.2 Total number of orders, total number of items, and overall value of orders
        public async Task<OverallOrderStatisticsDto> GetOverallOrderStatistics()
        {

            var result = await context.Orders
                .Select(order => new
                {
                    OrdersCount = context.Orders.Count(),
                    TotalItems = context.Items.Count(),
                    OverallOrderValue = context.Items.Sum(item => item.TotalPrice) ?? 0
                })
                .FirstOrDefaultAsync();

            return new OverallOrderStatisticsDto
            {
                TotalOrders = result.OrdersCount,
                TotalItems = result?.TotalItems ?? 0,
                OverallOrderValue = result?.OverallOrderValue ?? 0
            };
        }

        // 6 find and display products that have never been ordered (i.e., don't have entries in the Items table) but are present in stock (StorageLocations)
        public async Task<IEnumerable<NeverOrderedItemDto>> GetNeverOrderedItems()
        {
            var neverOrderedItems = await context.StorageLocations
                .Where(sl => !context.Items.Select(item => item.StorageLocationId).Contains(sl.Id))
              .Select(sl => new NeverOrderedItemDto
              {
                  StorageLocationId = sl.Id,
                  LocationDescription = sl.LocationDescription,
                  LocationName = sl.LocationName,
                  ProviderId = (decimal)sl.ProviderId,
                  UnitPrice = (decimal)sl.UnitPrice,
              })
              .ToListAsync();
            return neverOrderedItems;
        }
    }
}
