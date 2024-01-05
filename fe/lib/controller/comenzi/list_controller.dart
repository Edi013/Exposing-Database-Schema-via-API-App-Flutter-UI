import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListComenziController {
  void deleteById(BuildContext context, double id) {
    Provider.of<ComenziProvider>(context, listen: false).delete(id);
  }
}
