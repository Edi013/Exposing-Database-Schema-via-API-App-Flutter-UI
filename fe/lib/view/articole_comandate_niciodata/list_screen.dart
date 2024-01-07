import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/models/statistici_comenzi/articole_comandate_niciodata_dto.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';

class ArticoleComandateNiciodataScreen extends StatelessWidget {
  const ArticoleComandateNiciodataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ComenziProvider>(context).getArticoleComandateNiciodata();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Articole Comandate Niciodata Dto List'),
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
                  'Articole Comandate Niciodata Dto',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<ComenziProvider>(
                  builder: (context, articoleProvider, child) {
                    return ListView.builder(
                      itemCount:
                          articoleProvider.articoleComandateNiciodata.length,
                      itemBuilder: (context, index) {
                        ArticoleComandateNiciodataDto articole =
                            articoleProvider.articoleComandateNiciodata[index];
                        return ListTile(
                          title: Text('ID Stoc: ${articole.idStoc}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID Furnizori: ${articole.idFurnizori}'),
                              Text('Pret Unitar: ${articole.pretUnitar}'),
                              Text('Nume Unitate: ${articole.numeUnitate}'),
                              Text(
                                  'Descriere Unitate: ${articole.descriereUnitate}'),
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
