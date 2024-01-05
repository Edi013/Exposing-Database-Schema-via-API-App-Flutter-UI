using SGBD.Domain.Interfaces;
using SGBD.Domain.Models;

namespace SGBD.Application.Handlers
{
    public class ClientHandler
    {
        IRepository<Client> repository;

        public ClientHandler(IRepository<Client> repository)
        {
            this.repository = repository;
        }

        public async Task<Client> Create(Client request)
        {
            var newClient = new Client
            {
                Id = 0,
                LastName = request.LastName,
                FirstName = request.FirstName,
                City = request.City,
                PhoneNumber = request.PhoneNumber,
                Company = request.Company,
                PostalCode = request.PostalCode,
                Adress = request.Adress,
            };

            var result = await repository.Add(newClient);
            return result;
        }

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<Client>> GetAll()
        {
            var result = await repository.GetAll();
            return result;
        }

        public async Task<Client> Update(Client request)
        {

            var newClient = new Client
            {
                Id = request.Id,
                LastName = request.LastName,
                FirstName = request.FirstName,
                City = request.City,
                PhoneNumber = request.PhoneNumber,
                Company = request.Company,
                PostalCode = request.PostalCode,
                Adress = request.Adress,
            };

            var result = await repository.Update(newClient);
            return result;
        }
    }
}
