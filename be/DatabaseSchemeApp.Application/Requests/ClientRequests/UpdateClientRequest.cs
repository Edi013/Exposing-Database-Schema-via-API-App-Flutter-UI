﻿using DatabaseSchemeApp.Domain.Models;
using MediatR;

namespace DatabaseSchemeApp.Application.Requests.ClientRequests
{
    public class UpdateClientRequest : IRequest<Client>
    {
        public decimal Id { get; set; }
        public string Nume { get; set; }
        public string Prenume { get; set; }
        public string Companie { get; set; }
        public string Adresa { get; set; }
        public string Oras { get; set; }
        public string Cod { get; set; }
        public string Telefon { get; set; }
    }
}
