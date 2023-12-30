using DatabaseSchemeApp.Domain.Entities;
using MediatR;

namespace DatabaseSchemeApp.Application.Requests.ClientRequests
{
    public class CreateClientRequest : IRequest<Client>
    {
    }
}
