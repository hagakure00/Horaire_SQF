import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/HomePage.dart';
import 'Theme/ThemeSetup.dart';

void main() {
  runApp(
     CustomTheme(
        child: const MyApp(),
    ),
  );
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<ThemeData>(
      initialData: primaryTheme,
      stream: CustomTheme.of(context)!.streamController.stream,
      builder: (context, snapshot) => MaterialApp(
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [Locale('en'), Locale('fr')],
        debugShowCheckedModeBanner: false,
        title: 'Horaire',
        theme: snapshot.data,
        home: const HomePage(),
      ),
    );
  }
}


