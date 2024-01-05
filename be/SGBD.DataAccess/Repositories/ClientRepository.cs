using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class ClientRepository : RepositoryBase<Clienti>
    {
        public ClientRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
