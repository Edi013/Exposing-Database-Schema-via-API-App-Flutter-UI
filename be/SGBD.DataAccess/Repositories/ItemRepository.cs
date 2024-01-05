using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.DataAccess.Repositories
{
    public class ItemRepository : RepositoryBase<Item>
    {
        public ItemRepository(AppDbContext context)
            : base(context)
        { }
    }
}
