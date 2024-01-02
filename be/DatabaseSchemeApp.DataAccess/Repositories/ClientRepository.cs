using DatabaseSchemeApp.Domain.Interfaces;
using DatabaseSchemeApp.Domain.Models;

namespace DatabaseSchemeApp.DataAccess.Repositories
{
    public class ClientRepository : RepositoryBase<Client>, IClientRepository
    {
        public ClientRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
