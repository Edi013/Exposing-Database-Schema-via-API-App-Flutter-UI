import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stoc.dart';
import '../shared/enviroment.dart';

class StocRepository {
  final String apiExtension = '/Stoc';
  final String apiUrl = "${Environment.BASE_URL}/Stoc";

  StocRepository() {}

  Future<List<Stoc>> getAll() async {
    final response = await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<Stoc> result = data.map((json) => Stoc.fromJson(json)).toList();
    return result;
  }

  Future<Stoc> addStoc(Stoc stoc) async {
    final response = await http.post(
      Uri.parse('$apiUrl/Create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stoc.toJson()),
    );
    try {
      return Stoc.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to add Stoc');
    }
  }

  Future<Stoc> updateStoc(Stoc stoc) async {
    final response = await http.put(
      Uri.parse('$apiUrl/Update'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stoc.toJson()),
    );
    try {
      return Stoc.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to update Stoc + ${error}');
    }
  }

  Future<void> deleteStoc(double id) async {
    await http.delete(
      Uri.parse('$apiUrl/Delete/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
