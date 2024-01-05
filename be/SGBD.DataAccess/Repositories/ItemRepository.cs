using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class ItemRepository : RepositoryBase<Articole>
    {
        public ItemRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
