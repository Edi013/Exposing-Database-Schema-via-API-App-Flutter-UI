import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/articole.dart';
import '../shared/enviroment.dart';

class ArticoleRepository {
  final String apiExtension = '/Articole';
  final String apiUrl = "${Environment.BASE_URL}/Articole";

  ArticoleRepository() {}

  Future<List<Articole>> getAll() async {
    final response = await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<Articole> result =
        data.map((json) => Articole.fromJson(json)).toList();
    return result;
  }

  Future<Articole> addArticole(Articole articole) async {
    final response = await http.post(
      Uri.parse('$apiUrl/Create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(articole.toJson()),
    );
    try {
      return Articole.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to add Articole');
    }
  }

  Future<Articole> updateArticole(Articole articole) async {
    final response = await http.put(
      Uri.parse('$apiUrl/Update'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(articole.toJson()),
    );
    try {
      return Articole.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to update Articole + ${error}');
    }
  }

  Future<void> deleteArticole(double id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/Delete/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
