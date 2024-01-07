import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/controller/context_comanda/list_controller.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comanda_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ListContextComandaDtoScreen extends StatelessWidget {
  final ListContextComandaDtoController listContextComandaDtoController =
      ListContextComandaDtoController();

  ListContextComandaDtoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Comanda Dto List'),
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
                  'Context Comanda Dto',
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
                      itemCount: comenziProvider.contextFiecareComanda.length,
                      itemBuilder: (context, index) {
                        ContextComandaDto contextComandaDto =
                            comenziProvider.contextFiecareComanda[index];
                        return ListTile(
                          title: Text('Order ID: ${contextComandaDto.orderId}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Items Count: ${contextComandaDto.itemsCount}'),
                              Text(
                                  'Order Value: ${contextComandaDto.orderValue}'),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
