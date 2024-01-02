import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/client_model.dart';
import 'package:remind_me_fe/providers/client_provider.dart';

class EditController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _difficultyController;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get difficultyController => _difficultyController;

  void initControllers(Client clientToUpdate) {
    _titleController = TextEditingController(text: clientToUpdate.title);
    _descriptionController =
        TextEditingController(text: clientToUpdate.description);
    _startDateController =
        TextEditingController(text: clientToUpdate.startDate.toString());
    _endDateController =
        TextEditingController(text: clientToUpdate.endDate.toString());
    _difficultyController =
        TextEditingController(text: clientToUpdate.difficulty.toString());
  }

  String? validateFormField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    } else if (value.length < 2 && int.tryParse(value) == null) {
      return 'Field must be at least 2 characters';
    }
    return null;
  }

  void saveChanges(
    String title,
    String description,
    String startDate,
    String endDate,
    String difficulty,
    int index,
    Client clientToUpdate,
    BuildContext context,
  ) {
    if (_formKey.currentState!.validate()) {
      DateTime parsedStartDate = DateTime.parse(startDate);
      DateTime? parsedEndDate = endDate != "" ? DateTime.parse(endDate) : null;
      int parsedDifficulty = int.parse(difficulty);

      Client updatedClient = Client(
        title: title,
        description: description,
        creationDate: DateTime.now(),
        startDate: parsedStartDate,
        endDate: parsedEndDate,
        difficulty: parsedDifficulty,
        ownerId: clientToUpdate.ownerId,
        id: clientToUpdate.id,
        isFinished: clientToUpdate.isFinished,
      );

      Provider.of<ClientProvider>(context, listen: false)
          .update(index, updatedClient);

      Navigator.pop(context);
    }
  }
}
