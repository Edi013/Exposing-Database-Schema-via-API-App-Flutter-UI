import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remind_me_fe/models/client_model.dart';
import 'package:remind_me_fe/repositories/client_repository.dart';

class ClientProvider extends ChangeNotifier {
  late ClientRepository repository;
  late List<Client> clients = [];

  ClientProvider() {
    initialize();
  }

  void initialize() async {
    repository = ClientRepository();
    clients = await getAll();
    notifyListeners();
  }

  Future<List<Client>> getAll() async {
    return await repository.getAll();
  }

  Future<void> add(Client object) async {
    await repository.addClient(object).then((value) {
      clients.add(value);
      notifyListeners();
    });
  }

  Future<void> update(int index, Client updatedObject) async {
    await repository.updateClient(updatedObject).then((value) {
      clients[index] = value;
      notifyListeners();
    });
  }

  Future<void> delete(int id) async {
    await repository.deleteClient(id).then((value) {
      clients.remove(clients.firstWhere((element) => element.id == id));
      notifyListeners();
    });
  }
}
