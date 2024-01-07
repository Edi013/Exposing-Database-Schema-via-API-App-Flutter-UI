import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remind_me_fe/controller/comenzi/add_controller.dart';

class AddComenziScreen extends StatelessWidget {
  final AddComenziController addComenziController = AddComenziController();

  AddComenziScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Comenzi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: addComenziController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: addComenziController.idController,
                decoration: const InputDecoration(labelText: 'ID'),
                validator: (value) =>
                    addComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addComenziController.idClientiController,
                decoration: const InputDecoration(labelText: 'ID Clienti'),
                validator: (value) =>
                    addComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addComenziController.dataPlasareController,
                decoration: const InputDecoration(labelText: 'Data Plasare *'),
                onTap: () => addComenziController.selectDate(
                    context, addComenziController.dataPlasareController),
                validator: (value) =>
                    addComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addComenziController.dataOnorareController,
                decoration: const InputDecoration(labelText: 'Data Onorare'),
                onTap: () => addComenziController.selectDate(
                    context, addComenziController.dataOnorareController),
                validator: (value) =>
                    addComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: addComenziController.dataPlataController,
                decoration: const InputDecoration(labelText: 'Data Plata'),
                onTap: () => addComenziController.selectDate(
                    context, addComenziController.dataPlataController),
                validator: (value) =>
                    addComenziController.validateFormField(value),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => addComenziController.addItem(context),
                child: const Text('Add Comenzi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
