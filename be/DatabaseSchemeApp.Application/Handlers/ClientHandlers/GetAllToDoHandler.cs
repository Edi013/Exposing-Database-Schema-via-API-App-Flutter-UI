using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Entities;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class GetAllClientHandler : IRequestHandler<GetAllClientRequest, IEnumerable<Client>>
    {
        Task<IEnumerable<Client>> IRequestHandler<GetAllClientRequest, IEnumerable<Client>>.Handle(GetAllClientRequest request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
