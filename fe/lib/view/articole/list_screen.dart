import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/articole/list_controller.dart';
import 'package:remind_me_fe/models/articole.dart';
import 'package:remind_me_fe/providers/articole_provider.dart';

class ListArticoleScreen extends StatelessWidget {
  final ListArticoleController listArticoleController =
      ListArticoleController();

  ListArticoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Articole Table'),
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
                  'Articole',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ArticoleProvider>(
                  builder: (context, articoleProvider, child) {
                    return ListView.builder(
                      itemCount: articoleProvider.articoleList.length,
                      itemBuilder: (context, index) {
                        Articole articole =
                            articoleProvider.articoleList[index];
                        return ListTile(
                          title: Text('ID: ${articole.id}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID Comenzi: ${articole.idComenzi}'),
                              Text('ID Stoc: ${articole.idStoc}'),
                              Text('Cantitate: ${articole.cantitate}'),
                              Text('Pret Total: ${articole.pretTotal}'),
                              IconButton(
                                onPressed: () => listArticoleController
                                    .deleteById(context, articole.id!),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => listArticoleController.updateItem(
                              context, index, articole),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => listArticoleController.addItem(context),
                  child: const Text('Add Articole'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
