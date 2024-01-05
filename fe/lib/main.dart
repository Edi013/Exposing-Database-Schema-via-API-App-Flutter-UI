import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';
import 'package:remind_me_fe/view/comenzi/add_screen.dart';
import 'package:remind_me_fe/view/comenzi/list_screen.dart';
import 'package:remind_me_fe/view/comenzi/update_screen.dart';

void main() {
  try {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ComenziProvider(),
        child: const MyApp(),
      ),
    );
  } catch (e, stackTrace) {
    print("Error: $e + Stacktrace: $stackTrace");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object App',
      initialRoute: '/list_comenzi',
      routes: {
        '/list_comenzi': (context) => ListComenziScreen(),
        '/update_comenzi': (context) => UpdateComenziScreen(),
        '/add_comenzi': (context) => AddComenziScreen(),
      },
    );
  }
}
