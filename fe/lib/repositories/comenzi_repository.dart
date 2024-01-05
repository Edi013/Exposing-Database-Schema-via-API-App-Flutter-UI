import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comenzi.dart';
import '../shared/enviroment.dart';

class ComenziRepository {
  final String apiExtension = '/Comenzi';
  final String apiUrl = "${Environment.BASE_URL}/Comenzi";

  ComenziRepository() {}

  Future<List<Comenzi>> getAll() async {
    final response = await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<Comenzi> result = data.map((json) => Comenzi.fromJson(json)).toList();
    return result;
  }

  Future<Comenzi> addComenzi(Comenzi comenzi) async {
    final response = await http.post(
      Uri.parse('$apiUrl/Create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(comenzi.toJson()),
    );
    try {
      return Comenzi.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to add Comenzi');
    }
  }

  Future<Comenzi> updateComenzi(Comenzi comenzi) async {
    final response = await http.put(
      Uri.parse('$apiUrl/Update'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(comenzi.toJson()),
    );
    try {
      return Comenzi.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to update Comenzi + ${error}');
    }
  }

  Future<void> deleteComenzi(double id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/Delete/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
