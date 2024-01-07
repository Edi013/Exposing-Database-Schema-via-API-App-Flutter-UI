import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/clienti.dart';
import '../shared/enviroment.dart';

class ClientiRepository {
  final String apiExtension = '/Clienti';
  final String apiUrl = "${Environment.BASE_URL}/Clienti";

  ClientiRepository() {}

  Future<List<Clienti>> getAll() async {
    final response = await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<Clienti> result = data.map((json) => Clienti.fromJson(json)).toList();
    return result;
  }

  Future<Clienti> addClienti(Clienti clienti) async {
    final response = await http.post(
      Uri.parse('$apiUrl/Create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(clienti.toJson()),
    );
    try {
      return Clienti.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to add Clienti');
    }
  }

  Future<Clienti> updateClienti(Clienti clienti) async {
    final response = await http.put(
      Uri.parse('$apiUrl/Update'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(clienti.toJson()),
    );
    try {
      return Clienti.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to update Clienti + ${error}');
    }
  }

  Future<void> deleteClienti(double id) async {
    await http.delete(
      Uri.parse('$apiUrl/Delete/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
