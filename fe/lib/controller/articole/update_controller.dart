import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/articole.dart';
import 'package:remind_me_fe/providers/articole_provider.dart';

class UpdateArticoleController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idComenziController;
  late TextEditingController _idStocController;
  late TextEditingController _cantitateController;
  late TextEditingController _pretTotalController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get idComenziController => _idComenziController;
  TextEditingController get idStocController => _idStocController;
  TextEditingController get cantitateController => _cantitateController;
  TextEditingController get pretTotalController => _pretTotalController;

  void initControllers(Articole articoleToUpdate) {
    _idComenziController = TextEditingController(
        text: articoleToUpdate.idComenzi?.toString() ?? '');
    _idStocController =
        TextEditingController(text: articoleToUpdate.idStoc?.toString() ?? '');
    _cantitateController = TextEditingController(
        text: articoleToUpdate.cantitate?.toString() ?? '');
    _pretTotalController = TextEditingController(
        text: articoleToUpdate.pretTotal?.toString() ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> updateItem(
    double id,
    String idComenzi,
    String idStoc,
    String cantitate,
    String pretTotal,
    int index,
    Articole articoleToUpdate,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      Provider.of<ArticoleProvider>(context, listen: false).update(
        index,
        Articole(
          id: id,
          idComenzi: double.parse(idComenzi),
          idStoc: double.parse(idStoc),
          cantitate: double.parse(cantitate),
          pretTotal: double.parse(pretTotal),
        ),
      );

      Navigator.pop(context);
    }
  }
}
