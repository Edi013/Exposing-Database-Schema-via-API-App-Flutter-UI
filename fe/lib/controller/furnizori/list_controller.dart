import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/furnizori.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class ListFurnizoriController {
  void deleteById(BuildContext context, double id) {
    Provider.of<FurnizoriProvider>(context, listen: false).delete(id);
  }

  void updateItem(BuildContext context, int index, Furnizori furnizori) {
    Navigator.pushNamed(
      context,
      '/update_furnizori',
      arguments: {'index': index, 'object': furnizori},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_furnizori');
  }
}
