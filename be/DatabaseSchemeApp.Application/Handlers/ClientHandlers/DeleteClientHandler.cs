using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Interfaces;
using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class DeleteClientHandler : IRequestHandler<DeleteClientRequest, bool>
    {
        IRepository<Client> repository;

        public DeleteClientHandler(IRepository<Client> repository)
        {
            this.repository = repository;
        }

        public async Task<bool> Handle(DeleteClientRequest request, CancellationToken cancellationToken)
        {
            var result = await repository.DeleteById(request.Id);
            return result;
        }
    }
}
