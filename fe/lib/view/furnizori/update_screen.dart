import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/furnizori/update_controller.dart';
import 'package:remind_me_fe/models/furnizori.dart';

class UpdateFurnizoriScreen extends StatelessWidget {
  final UpdateFurnizoriController updateFurnizoriController =
      UpdateFurnizoriController();

  UpdateFurnizoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int index = arguments['index'];
    Furnizori furnizoriToUpdate = arguments['object'];

    updateFurnizoriController.initControllers(furnizoriToUpdate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Furnizori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateFurnizoriController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: updateFurnizoriController.numeFurnizoriController,
                decoration: const InputDecoration(labelText: 'Nume Furnizori'),
                validator: (value) =>
                    updateFurnizoriController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateFurnizoriController.timpExecutieController,
                decoration: const InputDecoration(labelText: 'Timp Executie'),
                validator: (value) =>
                    updateFurnizoriController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  updateFurnizoriController.updateItem(
                    furnizoriToUpdate.id!,
                    updateFurnizoriController.numeFurnizoriController.text,
                    updateFurnizoriController.timpExecutieController.text,
                    index,
                    furnizoriToUpdate,
                    context,
                  );
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
