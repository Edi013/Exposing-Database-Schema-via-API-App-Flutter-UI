import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/stoc.dart';
import 'package:remind_me_fe/providers/stoc_provider.dart';

class UpdateStocController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idFurnizoriController;
  late TextEditingController _pretUnitarController;
  late TextEditingController _descriereController;
  late TextEditingController _unitateController;
  late TextEditingController _descriereUnitateController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get idFurnizoriController => _idFurnizoriController;
  TextEditingController get pretUnitarController => _pretUnitarController;
  TextEditingController get descriereController => _descriereController;
  TextEditingController get unitateController => _unitateController;
  TextEditingController get descriereUnitateController =>
      _descriereUnitateController;

  void initControllers(Stoc stocToUpdate) {
    _idFurnizoriController =
        TextEditingController(text: stocToUpdate.idFurnizori?.toString() ?? '');
    _pretUnitarController =
        TextEditingController(text: stocToUpdate.pretUnitar?.toString() ?? '');
    _descriereController =
        TextEditingController(text: stocToUpdate.descriere ?? '');
    _unitateController =
        TextEditingController(text: stocToUpdate.numeLocatie ?? '');
    _descriereUnitateController =
        TextEditingController(text: stocToUpdate.descriereLocatie ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> updateItem(
    double id,
    String idFurnizori,
    String pretUnitar,
    String descriere,
    String unitate,
    String descriereUnitate,
    int index,
    Stoc stocToUpdate,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      Provider.of<StocProvider>(context, listen: false).update(
        index,
        Stoc(
          id: id,
          idFurnizori: double.parse(idFurnizori),
          pretUnitar: double.parse(pretUnitar),
          descriere: descriere,
          numeLocatie: unitate,
          descriereLocatie: descriereUnitate,
        ),
      );

      Navigator.pop(context);
    }
  }
}
