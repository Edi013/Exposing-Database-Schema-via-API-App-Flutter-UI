using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;
using System.Linq;


namespace SGBD.Application.Handlers
{
    public class StorageLocationHandler
    {
        IRepository<Stoc> repository;

        public StorageLocationHandler(IRepository<Stoc> repository)
        {
            this.repository = repository;
        }

        public async Task<Stoc> Create(StorageLocationDto request)
        {
            var newStorageLocation = new Stoc
            {
                Id = request.Id,
                DescriereUnitate = request.LocationDescription,
                Unitate = request.LocationName,
                IdFurnizori = request.ProviderId,
                PretUnitar = request.UnitPrice,
            };

            var result = await repository.Add(newStorageLocation);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<StorageLocationDto>> GetAll()
        {
            IEnumerable<StorageLocationDto> results = new List<StorageLocationDto>();

            var locations = await repository.GetAll();

            foreach(var storageLocation in locations) { 
                results = results.Append(new StorageLocationDto
                {
                    Id = storageLocation.Id,
                    LocationDescription = storageLocation.DescriereUnitate,
                    LocationName = storageLocation.Unitate,
                    ProviderId = storageLocation.IdFurnizori,
                    UnitPrice = storageLocation.PretUnitar
                }); 
            }
            return results;
        }

        public async Task<Stoc> Update(StorageLocationDto request)
        {

            var newStorageLocation = new Stoc
            {
                Id = request.Id,
                DescriereUnitate = request.LocationDescription,
                Unitate = request.LocationName,
                IdFurnizori = request.ProviderId,
                PretUnitar = request.UnitPrice,
            };

            var result = await repository.Update(newStorageLocation);
            return result;
        }
    }
}
