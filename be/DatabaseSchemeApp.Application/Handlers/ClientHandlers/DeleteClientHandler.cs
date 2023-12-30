using DatabaseSchemeApp.Application.Requests.ClientRequests;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class DeleteClientHandler : IRequestHandler<DeleteClientRequest, bool>
    {
        public Task<bool> Handle(DeleteClientRequest request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
