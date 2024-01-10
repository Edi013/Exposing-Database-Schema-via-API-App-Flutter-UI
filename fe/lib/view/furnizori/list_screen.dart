import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/furnizori/list_controller.dart';
import 'package:remind_me_fe/models/furnizori.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';

class ListFurnizoriScreen extends StatelessWidget {
  final ListFurnizoriController listFurnizoriController =
      ListFurnizoriController();

  ListFurnizoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Furnizori Table'),
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
                  'Furnizori',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<FurnizoriProvider>(
                  builder: (context, furnizoriProvider, child) {
                    return ListView.builder(
                      itemCount: furnizoriProvider.furnizoriList.length,
                      itemBuilder: (context, index) {
                        Furnizori furnizori =
                            furnizoriProvider.furnizoriList[index];
                        return ListTile(
                          title: Text('ID: ${furnizori.id}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Nume Furnizori: ${furnizori.numeFurnizori}'),
                              Text('Timp Executie: ${furnizori.timpExecutie}'),
                              IconButton(
                                onPressed: () => listFurnizoriController
                                    .deleteById(context, furnizori.id!),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => listFurnizoriController.updateItem(
                              context, index, furnizori),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => listFurnizoriController.addItem(context),
                  child: const Text('Add Furnizori'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
