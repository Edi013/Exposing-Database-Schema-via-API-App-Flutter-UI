import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/statistici_comenzi/context_comenzi_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ContextComenziScreen extends StatelessWidget {
  const ContextComenziScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ComenziProvider>(context).getContextComenzi();

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
                  'Context Comenzi',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ComenziProvider>(
                  builder: (context, contextComenziDtoProvider, child) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        ContextComenziDto contextComenziDto =
                            contextComenziDtoProvider.contextComenzi;
                        return ListTile(
                          title: Text(
                              'Numar Comenzi: ${contextComenziDto.numarComenzi}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Numar Articole: ${contextComenziDto.numarArticole}'),
                              Text(
                                  'Valoare Totala: ${contextComenziDto.valoareTotala}'),
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
