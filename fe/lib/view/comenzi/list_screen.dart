import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/comenzi/list_controller.dart';
import 'package:remind_me_fe/models/comenzi.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListComenziScreen extends StatelessWidget {
  final ListComenziController listComenziController = ListComenziController();

  ListComenziScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comenzi Table'),
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
                  'Comenzi',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ComenziProvider>(
                  builder: (context, comenziProvider, child) {
                    return ListView.builder(
                      itemCount: comenziProvider.comenziList.length,
                      itemBuilder: (context, index) {
                        Comenzi comenzi = comenziProvider.comenziList[index];
                        return ListTile(
                          title: Text('ID: ${comenzi.id}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID Clienti: ${comenzi.idClienti}'),
                              Text('Data Plasare: ${comenzi.dataPlasare}'),
                              Text('Data Onorare: ${comenzi.dataOnorare}'),
                              Text('Data Plata: ${comenzi.dataPlata}'),
                              IconButton(
                                onPressed: () => listComenziController
                                    .deleteById(context, comenzi.id!),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => listComenziController.updateItem(
                              context, index, comenzi),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => listComenziController.addItem(context),
                  child: const Text('Add Comenzi'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
