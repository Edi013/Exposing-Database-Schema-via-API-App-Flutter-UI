using System.Linq.Expressions;

namespace SGBD.Domain.Interfaces
{
    public interface IRepository<T> where T : class
    {
        Task<T> Add(T entity);
        Task<IEnumerable<T>> GetAll();
        Task<T> GetById(decimal id);
        Task<T> Update(T entity);
        Task<bool> Delete(T entity);
        Task<bool> DeleteById(decimal id);
        Task<T> SingleOrDefaultAsync(decimal id);
        Task<T> SingleByCondition(Expression<Func<T, bool>> expression);
        Task<bool> AnyByCondition(Expression<Func<T, bool>> expression);
        Task<IEnumerable<T>> FindByCondition(Expression<Func<T, bool>> expression);
    }
}