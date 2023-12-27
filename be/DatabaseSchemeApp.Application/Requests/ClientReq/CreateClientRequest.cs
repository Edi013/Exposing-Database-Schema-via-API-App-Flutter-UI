using DatabaseSchemeApp.Domain.Entities;
using MediatR;

namespace DatabaseSchemeApp.Application.Requests.ClientReq
{
    public class CreateClientRequest : IRequest<Client>
    {
    }
}
