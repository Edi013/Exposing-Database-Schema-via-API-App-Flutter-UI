import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/list_controller.dart';
import 'package:remind_me_fe/models/client_model.dart';
import 'package:remind_me_fe/providers/client_provider.dart';

class ListScreen extends StatelessWidget {
  final ListController controller = ListController();

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'To do',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ClientProvider>(
                  builder: (context, clientProvider, child) {
                    return ListView.builder(
                      itemCount: clientProvider.clients.length,
                      itemBuilder: (context, index) {
                        Client client = clientProvider.clients[index];
                        return ListTile(
                          title: Text(client.title),
                          subtitle: Column(
                            children: [
                              Text("Description: ${client.description}"),
                              Text(
                                  "Creation Date: ${client.creationDate.toString()}"),
                              Text(
                                  "Start Date: ${client.startDate.toString()}"),
                              Text("End Date: ${client.endDate.toString()}"),
                              Text(
                                  "Is finished: ${client.isFinished.toString()}"),
                              Text(
                                  "Difficulty: ${client.difficulty.toString()}"),
                              IconButton(
                                onPressed: () =>
                                    controller.deleteById(context, client.id!),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/update',
                              arguments: {'index': index, 'object': client},
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  child: const Text('Add Object'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
