import 'package:flutter/foundation.dart';
import '../models/clienti.dart';
import '../repositories/clienti_repository.dart';

class ClientiProvider extends ChangeNotifier {
  late ClientiRepository repository;
  late List<Clienti> clientiList = [];

  ClientiProvider._() {
    initialize();
  }

  static final ClientiProvider _instance = ClientiProvider._();

  factory ClientiProvider() => _instance;

  void initialize() async {
    repository = ClientiRepository();
    clientiList = await getAll();
    notifyListeners();
  }

  Future<List<Clienti>> getAll() async {
    clientiList = await repository.getAll();
    notifyListeners();
    return clientiList;
  }

  Future<void> add(Clienti object) async {
    await repository.addClienti(object).then(
      (value) {
        clientiList.add(value);
        notifyListeners();
      },
    );
  }

  Future<void> update(int index, Clienti updatedObject) async {
    await repository.updateClienti(updatedObject).then(
      (value) {
        clientiList[index] = value;
        notifyListeners();
      },
    );
  }

  Future<void> delete(double id) async {
    await repository.deleteClienti(id).then(
      (value) {
        clientiList
            .remove(clientiList.firstWhere((element) => element.id == id));
        notifyListeners();
      },
    );
  }
}
