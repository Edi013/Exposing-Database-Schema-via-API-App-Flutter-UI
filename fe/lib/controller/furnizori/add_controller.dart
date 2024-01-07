import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/furnizori.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class AddFurnizoriController {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _numeFurnizoriController =
      TextEditingController();
  final TextEditingController _timpExecutieController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get idController => _idController;
  TextEditingController get numeFurnizoriController => _numeFurnizoriController;
  TextEditingController get timpExecutieController => _timpExecutieController;
  GlobalKey<FormState> get formKey => _formKey;

  void addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double id = double.parse(_idController.text);
      String numeFurnizori = _numeFurnizoriController.text;
      double timpExecutie = double.parse(_timpExecutieController.text);

      Furnizori newFurnizori = Furnizori(
        id: id,
        numeFurnizori: numeFurnizori,
        timpExecutie: timpExecutie,
      );

      Provider.of<FurnizoriProvider>(context, listen: false).add(newFurnizori);

      Navigator.pop(context);
    }
  }

  String? validateFormField(value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }
}
