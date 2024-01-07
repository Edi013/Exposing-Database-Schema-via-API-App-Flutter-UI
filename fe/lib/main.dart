import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remind_me_fe/color-scheme.dart';
import 'package:remind_me_fe/providers/articole_provider.dart';
import 'package:remind_me_fe/providers/clienti_provider.dart';
import 'package:remind_me_fe/providers/comenzi_provider.dart';
import 'package:remind_me_fe/providers/furnizori_provider.dart';
import 'package:remind_me_fe/providers/stoc_provider.dart';
import 'package:remind_me_fe/routes.dart';

void main() {
  try {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ComenziProvider>(
              create: (_) => ComenziProvider()),
          ChangeNotifierProvider<ClientiProvider>(
              create: (_) => ClientiProvider()),
          ChangeNotifierProvider<ArticoleProvider>(
              create: (_) => ArticoleProvider()),
          ChangeNotifierProvider<StocProvider>(create: (_) => StocProvider()),
          ChangeNotifierProvider<FurnizoriProvider>(
              create: (_) => FurnizoriProvider()),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e, stackTrace) {
    print("Error: $e + Stacktrace: $stackTrace");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object App',
      initialRoute: Routes.initialRoute,
      routes: Routes.generateRoutes(),
      theme: ThemeData(
        colorScheme: AppColors.getAppColorScheme(),
      ),
    );
  }
}
