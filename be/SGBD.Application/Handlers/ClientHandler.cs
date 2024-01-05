using SGBD.Domain.Entities;
using SGBD.Domain.Interfaces;

namespace SGBD.Application.Handlers
{
    public class ClientHandler
    {
        IRepository<Clienti> repository;

        public ClientHandler(IRepository<Clienti> repository)
        {
            this.repository = repository;
        }

        public async Task<Clienti> Create(Clienti request)
        {
            var newClient = new Clienti
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

        public async Task<bool> Delete(decimal id)
        {
            var result = await repository.DeleteById(id);
            return result;
        }

        public async Task<IEnumerable<Clienti>> GetAll()
        {
            var result = await repository.GetAll();
            return result;
        }

        public async Task<Clienti> Update(Clienti request)
        {

            var newClient = new Clienti
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
