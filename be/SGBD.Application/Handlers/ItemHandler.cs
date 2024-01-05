using SGBD.Domain.DTOs;
using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.Application.Handlers
{
    public class ItemHandler
    {
        IRepository<Item> repository;

        public ItemHandler(IRepository<Item> repository)
        {
            this.repository = repository;
        }

        public async Task<Item> Create(ItemDto request)
        {
            var newItem = new Item
            {
                Id = request.Id,
                OrderId = request.OrderId,
                StorageLocationId = request.StorageLocationId,
                Quantity = request.Quantity,
                TotalPrice = request.TotalPrice,
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
                    OrderId = item.OrderId,
                    StorageLocationId = item.StorageLocationId,
                    Quantity = item.Quantity,
                    TotalPrice = item.TotalPrice,
                });
            }
            return result;
        }

        public async Task<Item> Update(ItemDto request)
        {

            var newItem = new Item
            {
               Id = request.Id,
               OrderId = request.OrderId,
               StorageLocationId = request.StorageLocationId,
               Quantity = request.Quantity,
               TotalPrice = request.TotalPrice,
            };

            var result = await repository.Update(newItem);
            return result;
        }
    }
}
