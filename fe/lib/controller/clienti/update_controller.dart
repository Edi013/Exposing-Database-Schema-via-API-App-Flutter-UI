import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/clienti.dart';
import 'package:remind_me_fe/providers/clienti_provider.dart';

class UpdateClientiController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _numeController;
  late TextEditingController _prenumeController;
  late TextEditingController _adresaController;
  late TextEditingController _companieController;
  late TextEditingController _orasController;
  late TextEditingController _codController;
  late TextEditingController _telefonController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get numeController => _numeController;
  TextEditingController get prenumeController => _prenumeController;
  TextEditingController get adresaController => _adresaController;
  TextEditingController get companieController => _companieController;
  TextEditingController get orasController => _orasController;
  TextEditingController get codController => _codController;
  TextEditingController get telefonController => _telefonController;

  void initControllers(Clienti clientiToUpdate) {
    _numeController = TextEditingController(text: clientiToUpdate.nume ?? '');
    _prenumeController =
        TextEditingController(text: clientiToUpdate.prenume ?? '');
    _adresaController =
        TextEditingController(text: clientiToUpdate.adresa ?? '');
    _companieController =
        TextEditingController(text: clientiToUpdate.companie ?? '');
    _orasController = TextEditingController(text: clientiToUpdate.oras ?? '');
    _codController = TextEditingController(text: clientiToUpdate.cod ?? '');
    _telefonController =
        TextEditingController(text: clientiToUpdate.telefon ?? '');
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> updateItem(
    double id,
    String nume,
    String prenume,
    String adresa,
    String companie,
    String oras,
    String cod,
    String telefon,
    int index,
    Clienti clientiToUpdate,
    BuildContext context,
  ) async {
    if (_formKey.currentState!.validate()) {
      Provider.of<ClientiProvider>(context, listen: false).update(
        index,
        Clienti(
          id: id,
          nume: nume,
          prenume: prenume,
          adresa: adresa,
          companie: companie,
          oras: oras,
          cod: cod,
          telefon: telefon,
        ),
      );

      Navigator.pop(context);
    }
  }
}
