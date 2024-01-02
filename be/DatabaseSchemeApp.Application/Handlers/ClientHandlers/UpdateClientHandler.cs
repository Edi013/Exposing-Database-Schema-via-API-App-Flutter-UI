using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Interfaces;
using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class UpdateClientHandler : IRequestHandler<UpdateClientRequest, Client>
    {
        IRepository<Client> repository;

        public UpdateClientHandler(IRepository<Client> repository)
        {
            this.repository = repository;
        }

        public async Task<Client> Handle(UpdateClientRequest request, CancellationToken cancellationToken)
        {

            var newClient = new Client
            {
                Id = request.Id,
                Nume = request.Nume,
                Prenume = request.Prenume,
                Oras = request.Oras,
                Telefon = request.Telefon,
                Companie = request.Companie,
                Cod = request.Cod,
                Adresa = request.Adresa,
            };

            var result = await repository.Update(newClient);
            return result;
        }
    }
}
