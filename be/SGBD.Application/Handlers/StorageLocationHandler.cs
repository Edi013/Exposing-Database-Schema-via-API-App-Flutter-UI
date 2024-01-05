using SGBD.Domain.DTOs;
using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;
using System.Linq;


namespace SGBD.Application.Handlers
{
    public class StorageLocationHandler
    {
        IRepository<StorageLocation> repository;

        public StorageLocationHandler(IRepository<StorageLocation> repository)
        {
            this.repository = repository;
        }

        public async Task<StorageLocation> Create(StorageLocationDto request)
        {
            var newStorageLocation = new StorageLocation
            {
                Id = request.Id,
                LocationDescription = request.LocationDescription,
                LocationName = request.LocationName,
                ProviderId = request.ProviderId,
                UnitPrice = request.UnitPrice,
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
                    LocationDescription = storageLocation.LocationDescription,
                    LocationName = storageLocation.LocationName,
                    ProviderId = storageLocation.ProviderId,
                    UnitPrice = storageLocation.UnitPrice
                }); 
            }
            return results;
        }

        public async Task<StorageLocation> Update(StorageLocationDto request)
        {

            var newStorageLocation = new StorageLocation
            {
                Id = request.Id,
                LocationDescription = request.LocationDescription,
                LocationName = request.LocationName,
                ProviderId = request.ProviderId,
                UnitPrice = request.UnitPrice,
            };

            var result = await repository.Update(newStorageLocation);
            return result;
        }
    }
}
