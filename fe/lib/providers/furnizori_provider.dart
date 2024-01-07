import 'package:flutter/foundation.dart';
import '../models/furnizori.dart';
import '../repositories/furnizori_repository.dart';

class FurnizoriProvider extends ChangeNotifier {
  late FurnizoriRepository repository;
  late List<Furnizori> furnizoriList = [];

  FurnizoriProvider() {
    initialize();
  }

  void initialize() async {
    repository = FurnizoriRepository();
    furnizoriList = await getAll();
    notifyListeners();
  }

  Future<List<Furnizori>> getAll() async {
    return await repository.getAll();
  }

  Future<void> add(Furnizori object) async {
    await repository.addFurnizori(object).then((value) {
      furnizoriList.add(value);
      notifyListeners();
    });
  }

  Future<void> update(int index, Furnizori updatedObject) async {
    await repository.updateFurnizori(updatedObject).then((value) {
      furnizoriList[index] = value;
      notifyListeners();
    });
  }

  Future<void> delete(double id) async {
    await repository.deleteFurnizori(id).then((value) {
      furnizoriList
          .remove(furnizoriList.firstWhere((element) => element.id == id));
      notifyListeners();
    });
  }
}