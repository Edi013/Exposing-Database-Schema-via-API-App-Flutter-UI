using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Entities;
using DatabaseSchemeApp.Domain.Interfaces;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class GetAllClientHandler : IRequestHandler<GetAllClientRequest, IEnumerable<Client>>
    {
        IRepository<Client> repository;

        public GetAllClientHandler(IRepository<Client> repository)
        {
            this.repository = repository;
        }
        async Task<IEnumerable<Client>> IRequestHandler<GetAllClientRequest, IEnumerable<Client>>.Handle(GetAllClientRequest request, CancellationToken cancellationToken)
        {
            var result = await repository.GetAll();
            return result;
        }
    }
}
