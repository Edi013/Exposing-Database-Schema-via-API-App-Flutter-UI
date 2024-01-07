import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/articole.dart';
import 'package:remind_me_fe/providers/articole_provider.dart';

class ListArticoleController {
  void deleteById(BuildContext context, double id) {
    Provider.of<ArticoleProvider>(context, listen: false).delete(id);
  }

  void updateItem(BuildContext context, int index, Articole articole) {
    Navigator.pushNamed(
      context,
      '/update_articole',
      arguments: {'index': index, 'object': articole},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_articole');
  }
}
