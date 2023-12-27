using MediatR;
using DatabaseSchemeApp.Domain.Entities;

namespace DatabaseSchemeApp.Application.Requests.ClientReq
{
    public class GetAllClientRequest : IRequest<IEnumerable<Client>>
    {
    }
}
