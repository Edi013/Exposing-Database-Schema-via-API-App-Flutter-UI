import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/furnizori/add_controller.dart';

class AddFurnizoriScreen extends StatelessWidget {
  final AddFurnizoriController addFurnizoriController =
      AddFurnizoriController();

  AddFurnizoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Furnizori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: addFurnizoriController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: addFurnizoriController.idController,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    addFurnizoriController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addFurnizoriController.numeFurnizoriController,
                decoration: const InputDecoration(labelText: 'Nume Furnizori'),
                validator: (value) =>
                    addFurnizoriController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addFurnizoriController.timpExecutieController,
                decoration: const InputDecoration(labelText: 'Timp Executie'),
                validator: (value) =>
                    addFurnizoriController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addFurnizoriController.addItem(context),
                child: const Text('Add Furnizori'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
