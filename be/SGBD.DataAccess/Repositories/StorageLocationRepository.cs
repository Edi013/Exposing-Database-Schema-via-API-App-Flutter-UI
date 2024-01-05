using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class StorageLocationRepository : RepositoryBase<Stoc>
    {
        public StorageLocationRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
