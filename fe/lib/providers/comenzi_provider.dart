import 'package:flutter/foundation.dart';
import '../models/comenzi.dart';
import '../repositories/comenzi_repository.dart';

class ComenziProvider extends ChangeNotifier {
  late ComenziRepository repository;
  late List<Comenzi> comenziList = [];

  ComenziProvider() {
    initialize();
  }

  void initialize() async {
    repository = ComenziRepository();
    comenziList = await getAll();
    notifyListeners();
  }

  Future<List<Comenzi>> getAll() async {
    return await repository.getAll();
  }

  Future<void> add(Comenzi object) async {
    await repository.addComenzi(object).then((value) {
      comenziList.add(value);
      notifyListeners();
    });
  }

  Future<void> update(int index, Comenzi updatedObject) async {
    await repository.updateComenzi(updatedObject).then((value) {
      comenziList[index] = value;
      notifyListeners();
    });
  }

  Future<void> delete(double id) async {
    await repository.deleteComenzi(id).then((value) {
      comenziList.remove(comenziList.firstWhere((element) => element.id == id));
      notifyListeners();
    });
  }
}
