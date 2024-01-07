import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/clienti/update_controller.dart';
import 'package:remind_me_fe/models/clienti.dart';

class UpdateClientiScreen extends StatelessWidget {
  final UpdateClientiController updateClientiController =
      UpdateClientiController();

  UpdateClientiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int index = arguments['index'];
    Clienti clientiToUpdate = arguments['object'];

    updateClientiController.initControllers(clientiToUpdate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Clienti'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateClientiController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: updateClientiController.numeController,
                decoration: const InputDecoration(labelText: 'Nume'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.prenumeController,
                decoration: const InputDecoration(labelText: 'Prenume'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.adresaController,
                decoration: const InputDecoration(labelText: 'Adresa'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.companieController,
                decoration: const InputDecoration(labelText: 'Companie'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.orasController,
                decoration: const InputDecoration(labelText: 'Oras'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.codController,
                decoration: const InputDecoration(labelText: 'Cod'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateClientiController.telefonController,
                decoration: const InputDecoration(labelText: 'Telefon'),
                validator: (value) =>
                    updateClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  updateClientiController.updateItem(
                    clientiToUpdate.id!,
                    updateClientiController.numeController.text,
                    updateClientiController.prenumeController.text,
                    updateClientiController.adresaController.text,
                    updateClientiController.companieController.text,
                    updateClientiController.orasController.text,
                    updateClientiController.codController.text,
                    updateClientiController.telefonController.text,
                    index,
                    clientiToUpdate,
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
