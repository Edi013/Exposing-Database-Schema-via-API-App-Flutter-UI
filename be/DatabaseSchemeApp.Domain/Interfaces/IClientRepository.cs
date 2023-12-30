namespace DatabaseSchemeApp.Domain.Interfaces
{
    public interface IClientRepository<T> : IRepository<T> where T : class
    {
    }
}
