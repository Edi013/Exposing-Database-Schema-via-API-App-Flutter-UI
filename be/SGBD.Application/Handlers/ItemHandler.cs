using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Application.Handlers
{
    public class ItemHandler
    {
        IRepository<Articole> repository;

        public ItemHandler(IRepository<Articole> repository)
        {
            this.repository = repository;
        }

        public async Task<Articole> Create(ItemDto request)
        {
            var newItem = new Articole
            {
                Id = request.Id,
                IdComenzi = request.OrderId,
                IdStoc = request.StorageLocationId,
                Cantitate = request.Quantity,
                PretTotal = request.TotalPrice,
            };

            var result = await repository.Add(newItem);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<ItemDto>> GetAll()
        {
            var items = await repository.GetAll();
            IEnumerable<ItemDto> result = new List<ItemDto>();

            foreach (var item in items)
            {
                result = result.Append(new ItemDto
                {
                    Id = item.Id,
                    OrderId = item.IdComenzi,
                    StorageLocationId = item.IdStoc,
                    Quantity = item.Cantitate,
                    TotalPrice = item.PretTotal,
                });
            }
            return result;
        }

        public async Task<Articole> Update(ItemDto request)
        {

            var newItem = new Articole
            {
               Id = request.Id,
               IdComenzi = request.OrderId,
               IdStoc = request.StorageLocationId,
               Cantitate = request.Quantity,
               PretTotal = request.TotalPrice,
            };

            var result = await repository.Update(newItem);
            return result;
        }
    }
}
