import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comanda_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ContextComandaScreen extends StatelessWidget {
  const ContextComandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ComenziProvider>(context).getContextFiecareComanda();

    return Scaffold(
      appBar: AppBar(),
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
                  'Context Comanda ',
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
