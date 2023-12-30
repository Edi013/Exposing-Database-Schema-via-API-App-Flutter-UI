using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Entities;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class CreateClientHandler : IRequestHandler<CreateClientRequest, Client>
    {
        public Task<Client> Handle(CreateClientRequest request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
