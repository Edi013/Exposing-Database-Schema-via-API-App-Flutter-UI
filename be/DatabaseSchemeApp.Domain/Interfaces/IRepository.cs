using System.Linq.Expressions;

namespace DatabaseSchemeApp.Domain.Interfaces
{
    public interface IRepository<T> where T : class
    {
        Task<T> Add(T entity);
        Task<IEnumerable<T>> GetAll();
        Task<T> GetById(int id);
        Task<T> Update(T entity);
        Task Delete(T entity);
        Task DeleteById(int id);
        Task<T> SingleOrDefaultAsync(int id);
        Task<T> SingleByCondition(Expression<Func<T, bool>> expression);
        Task<bool> AnyByCondition(Expression<Func<T, bool>> expression);
        Task<IEnumerable<T>> FindByCondition(Expression<Func<T, bool>> expression);
    }
}