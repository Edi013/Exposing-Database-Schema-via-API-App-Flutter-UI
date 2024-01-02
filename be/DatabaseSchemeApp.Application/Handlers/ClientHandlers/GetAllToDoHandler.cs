using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Interfaces;
using DatabaseSchemeApp.Domain.Models;
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

        public async Task<IEnumerable<Client>> Handle(GetAllClientRequest request, CancellationToken cancellationToken)
        {
            var result = await repository.GetAll();
            return result;
        }
    }
}
