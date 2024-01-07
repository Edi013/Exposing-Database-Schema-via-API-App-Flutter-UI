import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remind_me_fe/controller/articole/add_controller.dart';

class AddArticoleScreen extends StatelessWidget {
  final AddArticoleController addArticoleController = AddArticoleController();

  AddArticoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Articole'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: addArticoleController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: addArticoleController.idController,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    addArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addArticoleController.idComenziController,
                decoration: const InputDecoration(labelText: 'ID Comenzi'),
                validator: (value) =>
                    addArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addArticoleController.idStocController,
                decoration: const InputDecoration(labelText: 'ID Stoc'),
                validator: (value) =>
                    addArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addArticoleController.cantitateController,
                decoration: const InputDecoration(labelText: 'Cantitate'),
                validator: (value) =>
                    addArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addArticoleController.pretTotalController,
                decoration: const InputDecoration(labelText: 'Pret Total'),
                validator: (value) =>
                    addArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addArticoleController.addItem(context),
                child: const Text('Add Articole'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
