import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/stoc/update_controller.dart';
import 'package:remind_me_fe/models/stoc.dart';

class UpdateStocScreen extends StatelessWidget {
  final UpdateStocController updateStocController = UpdateStocController();

  UpdateStocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int index = arguments['index'];
    Stoc stocToUpdate = arguments['object'];

    updateStocController.initControllers(stocToUpdate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Stoc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateStocController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: updateStocController.idFurnizoriController,
                decoration: const InputDecoration(labelText: 'ID Furnizori'),
                validator: (value) =>
                    updateStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateStocController.pretUnitarController,
                decoration: const InputDecoration(labelText: 'Pret Unitar'),
                validator: (value) =>
                    updateStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateStocController.descriereController,
                decoration: const InputDecoration(labelText: 'Descriere'),
                validator: (value) =>
                    updateStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateStocController.unitateController,
                decoration: const InputDecoration(labelText: 'Unitate'),
                validator: (value) =>
                    updateStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateStocController.descriereUnitateController,
                decoration:
                    const InputDecoration(labelText: 'Descriere Unitate'),
                validator: (value) =>
                    updateStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  updateStocController.updateItem(
                    stocToUpdate.id!,
                    updateStocController.idFurnizoriController.text,
                    updateStocController.pretUnitarController.text,
                    updateStocController.descriereController.text,
                    updateStocController.unitateController.text,
                    updateStocController.descriereUnitateController.text,
                    index,
                    stocToUpdate,
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
