using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.DataAccess.Repositories
{
    public class FurnizoriRepository : RepositoryBase<Furnizori>
    {
        public FurnizoriRepository(ApplicationDbContext context)
            : base(context)
        { }
    }
}
