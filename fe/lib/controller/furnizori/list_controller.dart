import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class ListFurnizoriController {
  void deleteById(BuildContext context, double id) {
    Provider.of<FurnizoriProvider>(context, listen: false).delete(id);
  }
}
