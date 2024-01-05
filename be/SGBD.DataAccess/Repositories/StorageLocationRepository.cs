using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.DataAccess.Repositories
{
    public class StorageLocationRepository : RepositoryBase<StorageLocation>
    {
        public StorageLocationRepository(AppDbContext context)
            : base(context)
        { }
    }
}
