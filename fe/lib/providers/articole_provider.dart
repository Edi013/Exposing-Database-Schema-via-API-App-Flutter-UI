import 'package:flutter/foundation.dart';
import '../models/articole.dart'; // Make sure to import the correct path for your Articole model
import '../repositories/articole_repository.dart'; // Make sure to import the correct path for your ArticoleRepository

class ArticoleProvider extends ChangeNotifier {
  late ArticoleRepository repository;
  late List<Articole> articoleList = [];

  ArticoleProvider._() {
    initialize();
  }

  static final ArticoleProvider _instance = ArticoleProvider._();

  factory ArticoleProvider() => _instance;

  void initialize() async {
    repository = ArticoleRepository();
    articoleList = await getAll();
    notifyListeners();
  }

  Future<List<Articole>> getAll() async {
    articoleList = await repository.getAll();
    notifyListeners();
    return articoleList;
  }

  Future<void> add(Articole object) async {
    await repository.addArticole(object).then(
      (value) {
        articoleList.add(value);
        notifyListeners();
      },
    );
  }

  Future<void> update(int index, Articole updatedObject) async {
    await repository.updateArticole(updatedObject).then(
      (value) {
        articoleList[index] = value;
        notifyListeners();
      },
    );
  }

  Future<void> delete(double id) async {
    await repository.deleteArticole(id).then(
      (value) {
        articoleList
            .remove(articoleList.firstWhere((element) => element.id == id));
        notifyListeners();
      },
    );
  }
}
