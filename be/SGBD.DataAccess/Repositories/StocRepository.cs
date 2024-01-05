using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class StocRepository : RepositoryBase<Stoc>
    {
        public StocRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
