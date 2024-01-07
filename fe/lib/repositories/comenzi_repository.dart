import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remind_me_fe/models/statistici_comenzi/articole_comandate_niciodata_dto.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comanda_dto.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comenzi_dto.dart';
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

  Future<List<ContextComandaDto>> getContextFiecareComanda() async {
    final response = await http.get(
      Uri.parse('$apiUrl/ContextComanda'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<ContextComandaDto> result =
        data.map((json) => ContextComandaDto.fromJson(json)).toList();
    return result;
  }

  Future<List<ContextComenziDto>> getContextComenzi() async {
    final response = await http.get(
      Uri.parse('$apiUrl/ContextComanzi'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<ContextComenziDto> result =
        data.map((json) => ContextComenziDto.fromJson(json)).toList();
    return result;
  }

  Future<List<ArticoleComandateNiciodataDto>>
      getArticoleComandateNiciodata() async {
    final response = await http.get(
      Uri.parse('$apiUrl/ArticoleComandateNiciodata'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*'
      },
    );

    final List<dynamic> data = json.decode(response.body);
    List<ArticoleComandateNiciodataDto> result = data
        .map((json) => ArticoleComandateNiciodataDto.fromJson(json))
        .toList();
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
