using DatabaseSchemeApp.Application.Requests.ClientRequests;
using DatabaseSchemeApp.Domain.Interfaces;
using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Handlers.ClientHandlers
{
    public class CreateClientHandler : IRequestHandler<CreateClientRequest, Client>
    {
        IRepository<Client> repository;

        public CreateClientHandler(IRepository<Client> repository)
        {
            this.repository = repository;
        }

        public async Task<Client> Handle(CreateClientRequest request, CancellationToken cancellationToken)
        {
            var newClient = new Client
            {
                Id = 0,
                Nume = request.Nume,
                Prenume = request.Prenume,
                Oras = request.Oras,
                Telefon = request.Telefon,
                Companie = request.Companie,
                Cod = request.Cod,
                Adresa = request.Adresa,
            };
    
            var result = await repository.Add(newClient);
            return result;
        }
    }
}
