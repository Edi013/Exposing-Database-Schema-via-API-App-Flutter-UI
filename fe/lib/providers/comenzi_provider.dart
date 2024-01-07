import 'package:flutter/foundation.dart';
import 'package:remind_me_fe/models/statistici_comenzi/articole_comandate_niciodata_dto.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comanda_dto.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comenzi_dto.dart';
import '../models/comenzi.dart';
import '../repositories/comenzi_repository.dart';

class ComenziProvider extends ChangeNotifier {
  late ComenziRepository repository;
  late List<Comenzi> comenziList = [];
  late List<ContextComandaDto> contextFiecareComanda = [];
  late List<ContextComenziDto> contextComenzi = [];
  late List<ArticoleComandateNiciodataDto> articoleComandateNiciodata = [];

  ComenziProvider._() {
    initialize();
  }

  static final ComenziProvider _instance = ComenziProvider._();

  factory ComenziProvider() => _instance;

  void initialize() async {
    repository = ComenziRepository();
    comenziList = await getAll();
    notifyListeners();
  }

  Future<List<Comenzi>> getAll() async {
    comenziList = await repository.getAll();
    notifyListeners();
    return comenziList;
  }

  Future<List<ContextComandaDto>> getContextFiecareComanda() async {
    contextFiecareComanda = await repository.getContextFiecareComanda();
    notifyListeners();
    return contextFiecareComanda;
  }

  Future<List<ContextComenziDto>> getContextComenzi() async {
    contextComenzi = await repository.getContextComenzi();
    notifyListeners();
    return contextComenzi;
  }

  Future<List<ArticoleComandateNiciodataDto>>
      getArticoleComandateNiciodata() async {
    articoleComandateNiciodata =
        await repository.getArticoleComandateNiciodata();
    notifyListeners();
    return articoleComandateNiciodata;
  }

  Future<void> add(Comenzi object) async {
    await repository.addComenzi(object).then(
      (value) {
        comenziList.add(value);
        notifyListeners();
      },
    );
  }

  Future<void> update(int index, Comenzi updatedObject) async {
    await repository.updateComenzi(updatedObject).then(
      (value) {
        comenziList[index] = value;
        notifyListeners();
      },
    );
  }

  Future<void> delete(double id) async {
    await repository.deleteComenzi(id).then(
      (value) {
        comenziList
            .remove(comenziList.firstWhere((element) => element.id == id));
        notifyListeners();
      },
    );
  }
}
