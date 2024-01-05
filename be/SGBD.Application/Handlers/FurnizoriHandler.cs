using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Application.Handlers
{
    public class FurnizoriHandler
    {
        IRepository<Furnizori> repository;

        public FurnizoriHandler(IRepository<Furnizori> repository)
        {
            this.repository = repository;
        }

        public async Task<Furnizori> Create(Furnizori request)
        {
            var newProvider = new Furnizori
            {
                Id = request.Id,
                TimpExecutie = request.TimpExecutie,
                NumeFurnizori = request.NumeFurnizori,
            };

            var result = await repository.Add(newProvider);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<Furnizori>> GetAll()
        {
            var result = await repository.GetAll();
            return result;
        }

        public async Task<Furnizori> Update(Furnizori request)
        {

            var newProvider = new Furnizori
            {
                Id = request.Id,
                TimpExecutie = request.TimpExecutie,
                NumeFurnizori = request.NumeFurnizori,
            };

            var result = await repository.Update(newProvider);
            return result;
        }
    }
}
