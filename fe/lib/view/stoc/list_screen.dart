import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/stoc/list_controller.dart';
import 'package:remind_me_fe/models/stoc.dart';
import 'package:remind_me_fe/providers/stoc_provider.dart';

class ListStocScreen extends StatelessWidget {
  final ListStocController listStocController = ListStocController();

  ListStocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stoc List'),
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
                  'Stoc',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<StocProvider>(
                  builder: (context, stocProvider, child) {
                    return ListView.builder(
                      itemCount: stocProvider.stocList.length,
                      itemBuilder: (context, index) {
                        Stoc stoc = stocProvider.stocList[index];
                        return ListTile(
                          title: Text('ID: ${stoc.id}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID Furnizori: ${stoc.idFurnizori}'),
                              Text('Pret Unitar: ${stoc.pretUnitar}'),
                              Text('Descriere: ${stoc.descriere}'),
                              Text('Unitate: ${stoc.unitate}'),
                              Text(
                                  'Descriere Unitate: ${stoc.descriereUnitate}'),
                              IconButton(
                                onPressed: () => listStocController.deleteById(
                                    context, stoc.id!),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          onTap: () => listStocController.updateItem(
                              context, index, stoc),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => listStocController.addItem(context),
                  child: const Text('Add Stoc'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
