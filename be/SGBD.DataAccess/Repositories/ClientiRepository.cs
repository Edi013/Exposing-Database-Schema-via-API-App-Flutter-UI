using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class ClientiRepository : RepositoryBase<Clienti>
    {
        public ClientiRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
