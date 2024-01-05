using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.Application.Handlers
{
    public class ProviderHandler
    {
        IRepository<Provider> repository;

        public ProviderHandler(IRepository<Provider> repository)
        {
            this.repository = repository;
        }

        public async Task<Provider> Create(Provider request)
        {
            var newProvider = new Provider
            {
                Id = request.Id,
                ExecutionDuration = request.ExecutionDuration,
                ProviderName = request.ProviderName,
            };

            var result = await repository.Add(newProvider);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<Provider>> GetAll()
        {
            var result = await repository.GetAll();
            return result;
        }

        public async Task<Provider> Update(Provider request)
        {

            var newProvider = new Provider
            {
                Id = request.Id,
                ExecutionDuration = request.ExecutionDuration,
                ProviderName = request.ProviderName,
            };

            var result = await repository.Update(newProvider);
            return result;
        }
    }
}
