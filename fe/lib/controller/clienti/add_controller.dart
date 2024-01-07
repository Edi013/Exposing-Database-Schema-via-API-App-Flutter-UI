import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/clienti.dart';
import 'package:remind_me_fe/providers/clienti_provider.dart';

class AddClientiController {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _numeController = TextEditingController();
  final TextEditingController _prenumeController = TextEditingController();
  final TextEditingController _adresaController = TextEditingController();
  final TextEditingController _companieController = TextEditingController();
  final TextEditingController _orasController = TextEditingController();
  final TextEditingController _codController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get idController => _idController;
  TextEditingController get numeController => _numeController;
  TextEditingController get prenumeController => _prenumeController;
  TextEditingController get adresaController => _adresaController;
  TextEditingController get companieController => _companieController;
  TextEditingController get orasController => _orasController;
  TextEditingController get codController => _codController;
  TextEditingController get telefonController => _telefonController;
  GlobalKey<FormState> get formKey => _formKey;

  void addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double id = double.parse(_idController.text);
      String nume = _numeController.text;
      String prenume = _prenumeController.text;
      String adresa = _adresaController.text;
      String companie = _companieController.text;
      String oras = _orasController.text;
      String cod = _codController.text;
      String telefon = _telefonController.text;

      Clienti newClienti = Clienti(
        id: id,
        nume: nume,
        prenume: prenume,
        adresa: adresa,
        companie: companie,
        oras: oras,
        cod: cod,
        telefon: telefon,
      );

      Provider.of<ClientiProvider>(context, listen: false).add(newClienti);

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
