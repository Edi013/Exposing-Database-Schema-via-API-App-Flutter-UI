import 'package:flutter/material.dart';
import 'package:remind_me_fe/view/articole/add_screen.dart';
import 'package:remind_me_fe/view/articole/list_screen.dart';
import 'package:remind_me_fe/view/articole/update_screen.dart';
import 'package:remind_me_fe/view/clienti/add_screen.dart';
import 'package:remind_me_fe/view/clienti/list_screen.dart';
import 'package:remind_me_fe/view/clienti/update_screen.dart';
import 'package:remind_me_fe/view/comenzi/add_screen.dart';
import 'package:remind_me_fe/view/comenzi/list_screen.dart';
import 'package:remind_me_fe/view/comenzi/update_screen.dart';
import 'package:remind_me_fe/view/furnizori/add_screen.dart';
import 'package:remind_me_fe/view/furnizori/list_screen.dart';
import 'package:remind_me_fe/view/furnizori/update_screen.dart';
import 'package:remind_me_fe/view/home/home_screen.dart';
import 'package:remind_me_fe/view/statistici_comenzi/list_context_fiecare_comanda_screen.dart';
import 'package:remind_me_fe/view/stoc/add_screen.dart';
import 'package:remind_me_fe/view/stoc/list_screen.dart';
import 'package:remind_me_fe/view/stoc/update_screen.dart';

class Routes {
  static const String initialRoute = '/home';

  static const String listComenzi = '/list_comenzi';
  static const String updateComenzi = '/update_comenzi';
  static const String addComenzi = '/add_comenzi';
  static const String contextComanda = '/context_comanda';
  static const String contextComenzi = '/context_comenzi';
  static const String articoleComandateNiciodata =
      '/articole_niciodata_comandate';

  static const String listFurnizori = '/list_furnizori';
  static const String updateFurnizori = '/update_furnizori';
  static const String addFurnizori = '/add_furnizori';

  static const String listClienti = '/list_clienti';
  static const String updateClienti = '/update_clienti';
  static const String addClienti = '/add_clienti';

  static const String listArticole = '/list_articole';
  static const String updateArticole = '/update_articole';
  static const String addArticole = '/add_articole';

  static const String listStoc = '/list_stoc';
  static const String updateStoc = '/update_stoc';
  static const String addStoc = '/add_stoc';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      initialRoute: (context) => HomeScreen(),
      listComenzi: (context) => ListComenziScreen(),
      updateComenzi: (context) => UpdateComenziScreen(),
      addComenzi: (context) => AddComenziScreen(),
      listFurnizori: (context) => ListFurnizoriScreen(),
      updateFurnizori: (context) => UpdateFurnizoriScreen(),
      addFurnizori: (context) => AddFurnizoriScreen(),
      listClienti: (context) => ListClientiScreen(),
      updateClienti: (context) => UpdateClientiScreen(),
      addClienti: (context) => AddClientiScreen(),
      listArticole: (context) => ListArticoleScreen(),
      updateArticole: (context) => UpdateArticoleScreen(),
      addArticole: (context) => AddArticoleScreen(),
      listStoc: (context) => ListStocScreen(),
      updateStoc: (context) => UpdateStocScreen(),
      addStoc: (context) => AddStocScreen(),
      contextComanda: (context) => ListContextComandaDtoScreen(),
      contextComenzi: (context) => ContextComenziScreen(),
      articoleComandateNiciodata: (context) =>
          ArticoleComandateNiciodataScreen(),
    };
  }
}
