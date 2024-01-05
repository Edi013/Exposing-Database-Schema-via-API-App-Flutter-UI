using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class ProviderRepository : RepositoryBase<Furnizori>
    {
        public ProviderRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
