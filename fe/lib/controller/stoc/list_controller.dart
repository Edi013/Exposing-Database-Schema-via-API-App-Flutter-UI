import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/stoc.dart';
import 'package:remind_me_fe/providers/stoc_provider.dart';
import 'package:remind_me_fe/routes.dart';

class ListStocController {
  void deleteById(BuildContext context, double id) {
    Provider.of<StocProvider>(context, listen: false).delete(id);
  }

  void updateItem(BuildContext context, int index, Stoc stoc) {
    Navigator.pushNamed(
      context,
      Routes.updateStoc,
      arguments: {'index': index, 'object': stoc},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, Routes.addStoc);
  }
}
