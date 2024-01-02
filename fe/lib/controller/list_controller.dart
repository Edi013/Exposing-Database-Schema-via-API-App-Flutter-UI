import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/providers/client_provider.dart';

class ListController {
  void deleteById(BuildContext context, int id) {
    Provider.of<ClientProvider>(context, listen: false).delete(id);
  }
}
