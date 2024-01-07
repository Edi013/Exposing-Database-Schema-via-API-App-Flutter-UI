import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/articole.dart';
import 'package:remind_me_fe/providers/articole_provider.dart';

class AddArticoleController {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _idComenziController = TextEditingController();
  final TextEditingController _idStocController = TextEditingController();
  final TextEditingController _cantitateController = TextEditingController();
  final TextEditingController _pretTotalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get idController => _idController;
  TextEditingController get idComenziController => _idComenziController;
  TextEditingController get idStocController => _idStocController;
  TextEditingController get cantitateController => _cantitateController;
  TextEditingController get pretTotalController => _pretTotalController;
  GlobalKey<FormState> get formKey => _formKey;

  void addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double id = double.parse(_idController.text);
      double idComenzi = double.parse(_idComenziController.text);
      double idStoc = double.parse(_idStocController.text);
      double cantitate = double.parse(_cantitateController.text);
      double pretTotal = double.parse(_pretTotalController.text);

      Articole newArticole = Articole(
        id: id,
        idComenzi: idComenzi,
        idStoc: idStoc,
        cantitate: cantitate,
        pretTotal: pretTotal,
      );

      Provider.of<ArticoleProvider>(context, listen: false).add(newArticole);

      Navigator.pop(context);
    }
  }

  String? validateFormField(value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    // Implement your date selection logic here
  }
}
