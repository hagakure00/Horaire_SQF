import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:horaire/Pages/IntroPage.dart';
import 'package:theme_provider/theme_provider.dart';
import 'Theme/colors.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        final view = View.of(context);
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) { controller.setTheme(savedTheme);} else {
          Brightness platformBrightness = view.platformDispatcher.platformBrightness;
          if (platformBrightness == Brightness.dark) {controller.setTheme('dark');} else {controller.setTheme('light');}
          controller.forgetSavedTheme();}
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
        AppTheme(
          id: "blue", description: "blue Theme",
          data: ThemeData(primaryColor: primary,cardColor: primary,primarySwatch: Colors.grey,
              textSelectionTheme: const TextSelectionThemeData(cursorColor: primary, selectionColor: primary, selectionHandleColor: primary))),
        AppTheme(
            id: "red", description: "red Theme",
            data: ThemeData(primaryColor: red,cardColor: red,primarySwatch: Colors.grey,
                textSelectionTheme: const TextSelectionThemeData(cursorColor: red, selectionColor: red, selectionHandleColor: red))),
        AppTheme(
            id: "green", description: "green Theme",
            data: ThemeData(primaryColor: green,cardColor: green,primarySwatch: Colors.grey,
                textSelectionTheme: const TextSelectionThemeData(cursorColor: green, selectionColor: green, selectionHandleColor: green))),
        AppTheme(
            id: "orange", description: "orange Theme",
            data: ThemeData(primaryColor: orange,cardColor: orange,primarySwatch: Colors.grey,
                textSelectionTheme: const TextSelectionThemeData(cursorColor: orange, selectionColor: orange, selectionHandleColor: orange))),
        AppTheme(
            id: "purple", description: "purple Theme",
            data: ThemeData(primaryColor: purple,cardColor: purple,primarySwatch: Colors.grey,
                textSelectionTheme: const TextSelectionThemeData(cursorColor: purple, selectionColor: purple, selectionHandleColor: purple))),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder : (themeContext) => MaterialApp(
            localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
            supportedLocales: const [Locale('en'), Locale('fr')],
            debugShowCheckedModeBanner: false,
            title: 'Horaire',
            theme: ThemeProvider.themeOf(themeContext).data,
            home: const IntroPage(),
          ),
        ),
      ),
    );
  }
}



