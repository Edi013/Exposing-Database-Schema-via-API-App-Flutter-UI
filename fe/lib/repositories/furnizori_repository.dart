import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/furnizori.dart';
import '../shared/enviroment.dart';

class FurnizoriRepository {
  final String apiExtension = '/Furnizori';
  final String apiUrl = "${Environment.BASE_URL}/Furnizori";

  FurnizoriRepository() {}

  Future<List<Furnizori>> getAll() async {
    final response = await http.get(
      Uri.parse('$apiUrl/GetAll'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<Furnizori> result =
        data.map((json) => Furnizori.fromJson(json)).toList();
    return result;
  }

  Future<Furnizori> addFurnizori(Furnizori furnizori) async {
    final response = await http.post(
      Uri.parse('$apiUrl/Create'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(furnizori.toJson()),
    );
    try {
      return Furnizori.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to add Furnizori');
    }
  }

  Future<Furnizori> updateFurnizori(Furnizori furnizori) async {
    final response = await http.put(
      Uri.parse('$apiUrl/Update'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(furnizori.toJson()),
    );
    try {
      return Furnizori.fromJson(json.decode(response.body));
    } catch (error) {
      throw Exception('Failed to update Furnizori + ${error}');
    }
  }

  Future<void> deleteFurnizori(double id) async {
    await http.delete(
      Uri.parse('$apiUrl/Delete/$id'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
