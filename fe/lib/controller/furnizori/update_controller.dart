import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/furnizori.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class EditFurnizoriController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _numeFurnizoriController;
  late TextEditingController _timpExecutieController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get idController => _idController;
  TextEditingController get numeFurnizoriController => _numeFurnizoriController;
  TextEditingController get timpExecutieController => _timpExecutieController;

  void initControllers(Furnizori furnizoriToUpdate) {
    _idController =
        TextEditingController(text: furnizoriToUpdate.id?.toString() ?? '');
    _numeFurnizoriController =
        TextEditingController(text: furnizoriToUpdate.numeFurnizori ?? '');
    _timpExecutieController = TextEditingController(
        text: furnizoriToUpdate.timpExecutie?.toString() ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (double.tryParse(value) == null) {
      return 'Invalid number format';
    }
    return null;
  }

  void saveChanges(
    double id,
    String numeFurnizori,
    double timpExecutie,
    int index,
    BuildContext context,
  ) {
    if (_formKey.currentState!.validate()) {
      Provider.of<FurnizoriProvider>(context, listen: false).update(
        index,
        Furnizori(
          id: id,
          numeFurnizori: numeFurnizori,
          timpExecutie: timpExecutie,
        ),
      );

      Navigator.pop(context);
    }
  }
}
