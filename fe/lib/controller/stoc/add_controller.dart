import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/stoc.dart';
import 'package:remind_me_fe/providers/stoc_provider.dart';

class AddStocController {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _idFurnizoriController = TextEditingController();
  final TextEditingController _pretUnitarController = TextEditingController();
  final TextEditingController _descriereController = TextEditingController();
  final TextEditingController _unitateController = TextEditingController();
  final TextEditingController _descriereUnitateController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get idController => _idController;
  TextEditingController get idFurnizoriController => _idFurnizoriController;
  TextEditingController get pretUnitarController => _pretUnitarController;
  TextEditingController get descriereController => _descriereController;
  TextEditingController get unitateController => _unitateController;
  TextEditingController get descriereUnitateController =>
      _descriereUnitateController;
  GlobalKey<FormState> get formKey => _formKey;

  void addItem(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      double id = double.parse(_idController.text);
      double idFurnizori = double.parse(_idFurnizoriController.text);
      double pretUnitar = double.parse(_pretUnitarController.text);
      String descriere = _descriereController.text;
      String unitate = _unitateController.text;
      String descriereUnitate = _descriereUnitateController.text;

      Stoc newStoc = Stoc(
        id: id,
        idFurnizori: idFurnizori,
        pretUnitar: pretUnitar,
        descriere: descriere,
        unitate: unitate,
        descriereUnitate: descriereUnitate,
      );

      Provider.of<StocProvider>(context, listen: false).add(newStoc);

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
