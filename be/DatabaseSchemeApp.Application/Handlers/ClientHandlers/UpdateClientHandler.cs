using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class UpdateClientHandler : IRequestHandler<UpdateClientRequest, Client>
    {
        public Task<Client> Handle(UpdateClientRequest request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
