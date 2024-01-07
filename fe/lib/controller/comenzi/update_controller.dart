import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/comenzi.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class UpdateComenziController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _idClientiController;
  late TextEditingController _dataPlasareController;
  late TextEditingController _dataOnorareController;
  late TextEditingController _dataPlataController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get idClientiController => _idClientiController;
  TextEditingController get dataPlasareController => _dataPlasareController;
  TextEditingController get dataOnorareController => _dataOnorareController;
  TextEditingController get dataPlataController => _dataPlataController;

  void initControllers(Comenzi comenziToUpdate) {
    _idClientiController = TextEditingController(
        text: comenziToUpdate.idClienti?.toString() ?? '');
    _dataPlasareController = TextEditingController(
        text: comenziToUpdate.dataPlasare?.toString() ?? '');
    _dataOnorareController = TextEditingController(
        text: comenziToUpdate.dataOnorare?.toString() ?? '');
    _dataPlataController = TextEditingController(
        text: comenziToUpdate.dataPlata?.toString() ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> updateItem(
    double id,
    String idClienti,
    String dataPlasare,
    String dataOnorare,
    String dataPlata,
    int index,
    Comenzi comenziToUpdate,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      Provider.of<ComenziProvider>(context, listen: false).update(
        index,
        Comenzi(
          id: id,
          idClienti: double.parse(idClienti),
          dataPlasare: DateTime.parse(dataPlasare),
          dataOnorare:
              dataOnorare.isNotEmpty ? DateTime.parse(dataOnorare) : null,
          dataPlata: dataPlata.isNotEmpty ? DateTime.parse(dataPlata) : null,
        ),
      );

      Navigator.pop(context);
    }
  }
}
