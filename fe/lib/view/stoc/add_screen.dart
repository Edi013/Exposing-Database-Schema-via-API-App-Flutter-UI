import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remind_me_fe/controller/stoc/add_controller.dart';

class AddStocScreen extends StatelessWidget {
  final AddStocController addStocController = AddStocController();

  AddStocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Stoc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: addStocController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: addStocController.idController,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addStocController.idFurnizoriController,
                decoration: const InputDecoration(labelText: 'ID Furnizori'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addStocController.pretUnitarController,
                decoration: const InputDecoration(labelText: 'Pret Unitar'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addStocController.descriereController,
                decoration: const InputDecoration(labelText: 'Descriere'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addStocController.unitateController,
                decoration: const InputDecoration(labelText: 'Unitate'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addStocController.descriereUnitateController,
                decoration:
                    const InputDecoration(labelText: 'Descriere Unitate'),
                validator: (value) =>
                    addStocController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addStocController.addItem(context),
                child: const Text('Add Stoc'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
