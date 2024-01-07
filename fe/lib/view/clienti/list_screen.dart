import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/clienti/list_controller.dart';
import 'package:remind_me_fe/models/clienti.dart';
import 'package:remind_me_fe/providers/clienti_provider.dart';

class ListClientiScreen extends StatelessWidget {
  final ListClientiController listClientiController = ListClientiController();

  ListClientiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClientiProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clienti List'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Clienti',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<ClientiProvider>(
                    builder: (context, clientiProvider, child) {
                      return ListView.builder(
                        itemCount: clientiProvider.clientiList.length,
                        itemBuilder: (context, index) {
                          Clienti clienti = clientiProvider.clientiList[index];
                          return ListTile(
                            title: Text('ID: ${clienti.id}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nume: ${clienti.nume}'),
                                Text('Prenume: ${clienti.prenume}'),
                                Text('Adresa: ${clienti.adresa}'),
                                Text('Companie: ${clienti.companie}'),
                                Text('Oras: ${clienti.oras}'),
                                Text('Cod postal: ${clienti.cod}'),
                                Text('Telefon: ${clienti.telefon}'),
                                IconButton(
                                  onPressed: () => listClientiController
                                      .deleteById(context, clienti.id!),
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => listClientiController.updateItem(
                                context, index, clienti),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => listClientiController.addItem(context),
                    child: const Text('Add Clienti'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
