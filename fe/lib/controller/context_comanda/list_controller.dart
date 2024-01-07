import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comanda_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListContextComandaDtoController {
  void deleteById(BuildContext context, double orderId) {
    Provider.of<ComenziProvider>(context, listen: false).delete(orderId);
  }

  void updateItem(
      BuildContext context, int index, ContextComandaDto contextComandaDto) {
    Navigator.pushNamed(
      context,
      '/update_context_comanda_dto',
      arguments: {'index': index, 'object': contextComandaDto},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_context_comanda_dto');
  }
}
