using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.DataAccess.Repositories
{
    public class ClientRepository : RepositoryBase<Client>
    {
        public ClientRepository(AppDbContext context)
            : base(context)
        { }
    }
}
