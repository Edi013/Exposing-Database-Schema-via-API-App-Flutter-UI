import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comenzi_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListContextComenziDtoController {
  void deleteById(BuildContext context, double id) {
    Provider.of<ComenziProvider>(context, listen: false).delete(id);
  }

  void updateItem(
      BuildContext context, int index, ContextComenziDto contextComenziDto) {
    Navigator.pushNamed(
      context,
      '/update_context_comenzi_dto',
      arguments: {'index': index, 'object': contextComenziDto},
    );
  }

  addItem(BuildContext context) {
    Navigator.pushNamed(context, '/add_context_comenzi_dto');
  }
}
