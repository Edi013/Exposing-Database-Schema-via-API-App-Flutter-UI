using SGBD.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using SGBD.Domain.Entities;

namespace SGBD.DataAccess.Repositories
{
    public class RepositoryBase<T> : IRepository<T> where T : BaseEntity
    {
        protected ApplicationDbContext context;

        public RepositoryBase(ApplicationDbContext context)
        {
            this.context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await context.Set<T>().ToListAsync();
        }

        public async Task<T> GetById(decimal id)
        {
            return await context.Set<T>().FindAsync(id);
        }

        public async Task<T> Add(T entity)
        {
            await context.Set<T>().AddAsync(entity);
            await context.SaveChangesAsync();

            return entity;
        }

        public async Task<T> Update(T entity)
        {
            context.Update(entity);
            await context.SaveChangesAsync();
            return entity;
        }

        public async Task<bool> Delete(T entity)
        {
            context.Remove(entity);
            await context.SaveChangesAsync();
            return  await AnyByCondition(x => x.Id == entity.Id);
        }
        
        public async Task<bool> DeleteById(decimal id)
        {
            return await Delete(await GetById(id));
        }

        public async Task<T> SingleOrDefaultAsync(decimal id)
        {
            return await context.Set<T>()
                .AsNoTracking()
                .SingleAsync(x => x.Id == id);
        }

        public async Task<IEnumerable<T>> FindByCondition(Expression<Func<T, bool>> expression)
        {
            return await context.Set<T>().Where(expression).ToListAsync();
        }

        public async Task<bool> AnyByCondition(Expression<Func<T, bool>> expression)
        {
            return await context.Set<T>().AnyAsync(expression);
        }

        public async Task<T> SingleByCondition(Expression<Func<T, bool>> expression)
        {
            return await context.Set<T>().Where(expression).FirstOrDefaultAsync();
        }
    }
}
