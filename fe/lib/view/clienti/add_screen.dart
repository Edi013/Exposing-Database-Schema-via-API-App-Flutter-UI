import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remind_me_fe/controller/clienti/add_controller.dart';

class AddClientiScreen extends StatelessWidget {
  final AddClientiController addClientiController = AddClientiController();

  AddClientiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Clienti'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: addClientiController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: addClientiController.idController,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.numeController,
                decoration: const InputDecoration(labelText: 'Nume'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.prenumeController,
                decoration: const InputDecoration(labelText: 'Prenume'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.adresaController,
                decoration: const InputDecoration(labelText: 'Adresa'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.companieController,
                decoration: const InputDecoration(labelText: 'Companie'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.orasController,
                decoration: const InputDecoration(labelText: 'Oras'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.codController,
                decoration: const InputDecoration(labelText: 'Cod'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addClientiController.telefonController,
                decoration: const InputDecoration(labelText: 'Telefon'),
                validator: (value) =>
                    addClientiController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addClientiController.addItem(context),
                child: const Text('Add Clienti'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
