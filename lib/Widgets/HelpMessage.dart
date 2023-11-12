
import 'package:flutter/material.dart';



class HelpMessage {

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

   static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text, style: const TextStyle(fontSize: 14)),backgroundColor: Colors.red);

     messengerKey.currentState!
       ..removeCurrentSnackBar()
       ..showSnackBar(snackBar);

  }
}