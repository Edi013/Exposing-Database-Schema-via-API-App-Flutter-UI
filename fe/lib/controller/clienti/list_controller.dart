import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/clienti.dart';
import 'package:remind_me_fe/providers/clienti_provider.dart';

class ListClientiController {
  void deleteById(BuildContext context, double id) {
    Provider.of<ClientiProvider>(context, listen: false).delete(id);
  }

  void updateItem(BuildContext context, int index, Clienti clienti) {
    Navigator.pushNamed(
      context,
      '/update_clienti',
      arguments: {'index': index, 'object': clienti},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_clienti');
  }
}
