import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:remind_me_fe/models/dto_requests/create_client_request.dart';
import 'package:remind_me_fe/models/dto_requests/delete_client_request.dart';
import 'package:remind_me_fe/models/dto_requests/update_client_request.dart';

import 'package:remind_me_fe/models/client_model.dart';
import 'package:remind_me_fe/shared/enviroment.dart';

class ClientRepository {
  final String apiExtension = '/Client';
  final String apiUrl = "${Environment.BASE_URL}/Client";
  final dio = Dio();

  Future<List<Client>> getAll() async {
    return await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    ).then(
      (response) {
        final List<dynamic> data = json.decode(response.body);
        List<Client> result =
            data.map((json) => Client.fromJson(json)).toList();
        return result;
      },
    );
  }

  Future<Client> addClient(Client client) async {
    CreateClientRequest newClient = CreateClientRequest(
      title: client.title,
      description: client.description,
      creationDate: client.creationDate,
      startDate: client.startDate,
      endDate: client.endDate,
      isFinished: client.isFinished,
      difficulty: client.difficulty,
      ownerId: client.ownerId,
    );

    return await http
        .post(
          Uri.parse('$apiUrl/Create'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(newClient.toJson()),
        )
        .then(
          (value) => Client.fromJson(json.decode(value.body)),
        );
  }

  Future<Client> updateClient(Client client) async {
    UpdateClientRequest updatedClient = UpdateClientRequest(
      id: client.id!,
      title: client.title,
      description: client.description,
      difficulty: client.difficulty,
      isFinished: client.isFinished,
      creationDate: client.creationDate,
      startDate: client.startDate,
      endDate: client.endDate,
      ownerId: client.ownerId,
    );

    return await http
        .put(
          Uri.parse('$apiUrl/Update'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(updatedClient.toJson()),
        )
        .then(
          (value) => Client.fromJson(json.decode(value.body)),
        );
  }

  Future<void> deleteClient(int clientId) async {
    DeleteClientRequest deleteRequest = DeleteClientRequest(id: clientId);

    await http
        .delete(
      Uri.parse('$apiUrl/Delete'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(deleteRequest.toJson()),
    )
        .then((value) {
      return;
    });
  }
}
