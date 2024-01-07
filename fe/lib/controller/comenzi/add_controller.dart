import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/comenzi.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class AddComenziController {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _idClientiController = TextEditingController();
  final TextEditingController _dataPlasareController = TextEditingController();
  final TextEditingController _dataOnorareController = TextEditingController();
  final TextEditingController _dataPlataController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get idController => _idController;
  TextEditingController get idClientiController => _idClientiController;
  TextEditingController get dataPlasareController => _dataPlasareController;
  TextEditingController get dataOnorareController => _dataOnorareController;
  TextEditingController get dataPlataController => _dataPlataController;
  GlobalKey<FormState> get formKey => _formKey;

  void addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double id = double.parse(_idController.text);
      double idClienti = double.parse(_idClientiController.text);
      DateTime? dataPlasare = _parseDate(_dataPlasareController.text);
      DateTime? dataOnorare = _parseDate(_dataOnorareController.text);
      DateTime? dataPlata = _parseDate(_dataPlataController.text);

      Comenzi newComenzi = Comenzi(
        id: id,
        idClienti: idClienti,
        dataPlasare: dataPlasare,
        dataOnorare: dataOnorare,
        dataPlata: dataPlata,
      );

      Provider.of<ComenziProvider>(context, listen: false).add(newComenzi);

      Navigator.pop(context);
    }
  }

  String? validateFormField(value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  DateTime? _parseDate(String date) {
    return date.isNotEmpty ? DateFormat("yyyy-MM-dd").parse(date) : null;
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != controller.text) {
      controller.text = DateFormat("yyyy-MM-dd").format(pickedDate);
    }
  }
}
