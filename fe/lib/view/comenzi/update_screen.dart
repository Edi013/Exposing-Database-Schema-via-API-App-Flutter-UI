import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/comenzi/update_controller.dart';
import 'package:remind_me_fe/models/comenzi.dart';

class UpdateComenziScreen extends StatelessWidget {
  final UpdateComenziController updateComenziController =
      UpdateComenziController();

  UpdateComenziScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int index = arguments['index'];
    Comenzi comenziToUpdate = arguments['object'];

    updateComenziController.initControllers(comenziToUpdate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Comenzi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateComenziController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: updateComenziController.idClientiController,
                decoration: const InputDecoration(labelText: 'ID Clienti'),
                validator: (value) =>
                    updateComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateComenziController.dataPlasareController,
                decoration: const InputDecoration(labelText: 'Data Plasare'),
                validator: (value) =>
                    updateComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateComenziController.dataOnorareController,
                decoration: const InputDecoration(labelText: 'Data Onorare'),
                validator: (value) =>
                    updateComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateComenziController.dataPlataController,
                decoration: const InputDecoration(labelText: 'Data Plata'),
                validator: (value) =>
                    updateComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  updateComenziController.saveChanges(
                    updateComenziController.idClientiController.text,
                    updateComenziController.dataPlasareController.text,
                    updateComenziController.dataOnorareController.text,
                    updateComenziController.dataPlataController.text,
                    index,
                    comenziToUpdate,
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
