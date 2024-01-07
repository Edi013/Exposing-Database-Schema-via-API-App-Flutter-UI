using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;
using System.Linq;


namespace SGBD.Application.Handlers
{
    public class StocHandler
    {
        IRepository<Stoc> repository;

        public StocHandler(IRepository<Stoc> repository)
        {
            this.repository = repository;
        }

        public async Task<Stoc> Create(StocDto request)
        {
            var newStorageLocation = new Stoc
            {
                DescriereUnitate = request.DescriereLocatie,
                Unitate = request.NumeLocatie,
                IdFurnizori = request.IdFurnizori,
                PretUnitar = request.PretUnitar,
                Descriere = request.Descriere
            };

            var result = await repository.Add(newStorageLocation);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<StocDto>> GetAll()
        {
            IEnumerable<StocDto> results = new List<StocDto>();

            var locatii = await repository.GetAll();

            foreach(var Stoc in locatii) { 
                results = results.Append(new StocDto
                {
                    Id = Stoc.Id,
                    DescriereLocatie = Stoc.DescriereUnitate,
                    NumeLocatie = Stoc.Unitate,
                    IdFurnizori = Stoc.IdFurnizori,
                    PretUnitar = Stoc.PretUnitar,
                    Descriere = Stoc.Descriere
                }); 
            }
            return results;
        }

        public async Task<Stoc> Update(StocDto request)
        {

            var newStorageLocation = new Stoc
            {
                Id = request.Id,
                DescriereUnitate = request.DescriereLocatie,
                Unitate = request.NumeLocatie,
                IdFurnizori = request.IdFurnizori,
                PretUnitar = request.PretUnitar,
                Descriere = request.Descriere
            };

            var result = await repository.Update(newStorageLocation);
            return result;
        }
    }
}
