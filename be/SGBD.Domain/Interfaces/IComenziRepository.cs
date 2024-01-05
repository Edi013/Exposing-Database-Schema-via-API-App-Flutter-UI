using SGBD.Domain.DTOs;
using SGBD.Domain.Entities;

namespace SGBD.Domain.Interfaces
{
    public interface IComenziRepository : IRepository<Comenzi>
    {
        Task<IQueryable<ContextComandaDto>> GetContextComanda();
        Task<ContextComenziDto> GetContextComenzi();
        Task<IEnumerable<ArticoleComandateNiciodataDto>> GetArticoleComandateNiciodata();

    }
}
