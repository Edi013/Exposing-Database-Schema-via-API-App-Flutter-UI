using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class ArticoleRepository : RepositoryBase<Articole>
    {
        public ArticoleRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
