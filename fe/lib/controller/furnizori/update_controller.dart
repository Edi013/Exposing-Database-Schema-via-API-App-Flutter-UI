import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/furnizori.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class UpdateFurnizoriController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _numeFurnizoriController;
  late TextEditingController _timpExecutieController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get numeFurnizoriController => _numeFurnizoriController;
  TextEditingController get timpExecutieController => _timpExecutieController;

  void initControllers(Furnizori furnizoriToUpdate) {
    _numeFurnizoriController =
        TextEditingController(text: furnizoriToUpdate.numeFurnizori ?? '');
    _timpExecutieController = TextEditingController(
        text: furnizoriToUpdate.timpExecutie?.toString() ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> updateItem(
    double id,
    String numeFurnizori,
    String timpExecutie,
    int index,
    Furnizori furnizoriToUpdate,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      Provider.of<FurnizoriProvider>(context, listen: false).update(
        index,
        Furnizori(
          id: id,
          numeFurnizori: numeFurnizori,
          timpExecutie: double.parse(timpExecutie),
        ),
      );

      Navigator.pop(context);
    }
  }
}
