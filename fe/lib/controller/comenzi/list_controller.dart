import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/comenzi.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListComenziController {
  void deleteById(BuildContext context, double id) {
    Provider.of<ComenziProvider>(context, listen: false).delete(id);
  }

  void updateItem(BuildContext context, int index, Comenzi comenzi) {
    Navigator.pushNamed(
      context,
      '/update_comenzi',
      arguments: {'index': index, 'object': comenzi},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_comenzi');
  }
}
