import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';


    ThemeData primaryTheme =  ThemeData(primaryColor: primary,cardColor: primary,primarySwatch: Colors.grey,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: primary, selectionColor: primary, selectionHandleColor: primary));

    ThemeData greenTheme =  ThemeData(primaryColor: green,cardColor: green,primarySwatch: Colors.grey,
         textSelectionTheme: const TextSelectionThemeData(cursorColor: green, selectionColor: green, selectionHandleColor: green,));

    ThemeData orangeTheme =  ThemeData(primaryColor: orange,cardColor: orange,primarySwatch: Colors.grey,
         textSelectionTheme: const TextSelectionThemeData(cursorColor: orange, selectionColor: orange, selectionHandleColor: orange,));

    ThemeData redTheme =  ThemeData(primaryColor: red,cardColor: red,primarySwatch: Colors.grey,
         textSelectionTheme: const TextSelectionThemeData(cursorColor: red, selectionColor: red, selectionHandleColor: red,));

    ThemeData purpleTheme =  ThemeData(primaryColor: purple,cardColor: purple,primarySwatch: Colors.grey,
         textSelectionTheme: const TextSelectionThemeData(cursorColor: purple, selectionColor: purple, selectionHandleColor: purple,));


class CustomTheme extends InheritedWidget {
    CustomTheme({Key? key, required this.child}) : super(key: key, child: child);

    final Widget child;
    final StreamController<ThemeData> streamController = StreamController();


    static CustomTheme? of(BuildContext context) {
        return context.dependOnInheritedWidgetOfExactType<CustomTheme>();
    }

    @override
    bool updateShouldNotify(CustomTheme oldWidget) {
        return oldWidget != this;
    }
}



