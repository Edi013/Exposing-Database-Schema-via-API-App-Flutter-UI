import 'package:flutter/material.dart';
import 'package:remind_me_fe/controller/articole/update_controller.dart';
import 'package:remind_me_fe/models/articole.dart';

class UpdateArticoleScreen extends StatelessWidget {
  final UpdateArticoleController updateArticoleController =
      UpdateArticoleController();

  UpdateArticoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    int index = arguments['index'];
    Articole articoleToUpdate = arguments['object'];

    updateArticoleController.initControllers(articoleToUpdate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Articole'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: updateArticoleController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: updateArticoleController.idComenziController,
                decoration: const InputDecoration(labelText: 'ID Comenzi'),
                validator: (value) =>
                    updateArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateArticoleController.idStocController,
                decoration: const InputDecoration(labelText: 'ID Stoc'),
                validator: (value) =>
                    updateArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateArticoleController.cantitateController,
                decoration: const InputDecoration(labelText: 'Cantitate'),
                validator: (value) =>
                    updateArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: updateArticoleController.pretTotalController,
                decoration: const InputDecoration(labelText: 'Pret Total'),
                validator: (value) =>
                    updateArticoleController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  updateArticoleController.updateItem(
                    articoleToUpdate.id!,
                    updateArticoleController.idComenziController.text,
                    updateArticoleController.idStocController.text,
                    updateArticoleController.cantitateController.text,
                    updateArticoleController.pretTotalController.text,
                    index,
                    articoleToUpdate,
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
