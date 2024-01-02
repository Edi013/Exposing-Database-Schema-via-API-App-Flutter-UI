import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/providers/client_provider.dart';
import 'package:remind_me_fe/view/add_screen.dart';
import 'package:remind_me_fe/view/list_screen.dart';
import 'package:remind_me_fe/view/update_screen.dart';

void main() {
  try {
    runApp(
      ChangeNotifierProvider(
        create: (context) => ClientProvider(),
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
      initialRoute: '/list',
      routes: {
        '/list': (context) => ListScreen(),
        '/update': (context) => EditScreen(),
        '/add': (context) => AddScreen(),
      },
    );
  }
}
