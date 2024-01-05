using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.DataAccess.Repositories
{
    public class ProviderRepository : RepositoryBase<Provider>
    {
        public ProviderRepository(AppDbContext context)
            : base(context)
        { }
    }
}
