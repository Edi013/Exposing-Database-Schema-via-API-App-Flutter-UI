using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Application.Handlers
{
    public class ArticoleHandler
    {
        IRepository<Articole> repository;

        public ArticoleHandler(IRepository<Articole> repository)
        {
            this.repository = repository;
        }

        public async Task<Articole> Create(ArticoleDto request)
        {
            var newItem = new Articole
            {
                Id = request.Id,
                IdComenzi = request.IdComenzi,
                IdStoc = request.IdStoc,
                Cantitate = request.Cantitate,
                PretTotal = request.PretTotal,
            };

            var result = await repository.Add(newItem);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<ArticoleDto>> GetAll()
        {
            var articole = await repository.GetAll();
            IEnumerable<ArticoleDto> result = new List<ArticoleDto>();

            foreach (var articol in articole)
            {
                result = result.Append(new ArticoleDto
                {
                    Id = articol.Id,
                    IdComenzi = articol.IdComenzi,
                    IdStoc = articol.IdStoc,
                    Cantitate = articol.Cantitate,
                    PretTotal = articol.PretTotal,
                });
            }
            return result;
        }

        public async Task<Articole> Update(ArticoleDto request)
        {

            var newItem = new Articole
            {
               Id = request.Id,
               IdComenzi = request.IdComenzi,
               IdStoc = request.IdStoc,
               Cantitate = request.Cantitate,
               PretTotal = request.PretTotal,
            };

            var result = await repository.Update(newItem);
            return result;
        }
    }
}
