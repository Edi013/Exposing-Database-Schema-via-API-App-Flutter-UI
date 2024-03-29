import 'package:flutter/material.dart';
import 'package:remind_me_fe/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.listClienti);
                },
                child: Text('Clienti Table'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.listComenzi);
                },
                child: Text('Comenzi Table'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.contextComanda);
                },
                child: Text('Context pentru fiecare comanda'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.contextComenzi);
                },
                child: Text('Context pentru toate comenzile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, Routes.articoleComandateNiciodata);
                },
                child: Text('Articole niciodata comandate'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.listArticole);
                },
                child: Text('Articole Table'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.listStoc);
                },
                child: Text('Stoc Table'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.listFurnizori);
                },
                child: Text('Furnizori Table'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
