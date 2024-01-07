import 'package:flutter/foundation.dart';
import '../models/stoc.dart';
import '../repositories/stoc_repository.dart';

class StocProvider extends ChangeNotifier {
  late StocRepository repository;
  late List<Stoc> stocList = [];

  StocProvider._() {
    initialize();
  }

  static final StocProvider _instance = StocProvider._();

  factory StocProvider() => _instance;

  void initialize() async {
    repository = StocRepository();
    stocList = await getAll();
    notifyListeners();
  }

  Future<List<Stoc>> getAll() async {
    stocList = await repository.getAll();
    notifyListeners();
    return stocList;
  }

  Future<void> add(Stoc object) async {
    await repository.addStoc(object).then(
      (value) {
        stocList.add(value);
        notifyListeners();
      },
    );
  }

  Future<void> update(int index, Stoc updatedObject) async {
    await repository.updateStoc(updatedObject).then(
      (value) {
        stocList[index] = value;
        notifyListeners();
      },
    );
  }

  Future<void> delete(double id) async {
    await repository.deleteStoc(id).then(
      (value) {
        stocList.remove(stocList.firstWhere((element) => element.id == id));
        notifyListeners();
      },
    );
  }
}
