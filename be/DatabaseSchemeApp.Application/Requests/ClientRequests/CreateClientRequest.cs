using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Requests.ClientRequests
{
    public class CreateClientRequest : IRequest<Client>
    {
    }
}
