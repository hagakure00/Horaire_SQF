import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Theme/colors.dart';

import 'HomePage.dart';




class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150,bottom: 0),
            child: SizedBox(
              height:200,
              child: Image.asset("assets/images/logo.png",fit: BoxFit.cover,),
            ),
          ),
          Text("Enregister vos heures de travail",
              style: GoogleFonts.oswald(textStyle: const TextStyle(color: black,fontSize: 18,letterSpacing: 0.5,height: 1,decoration: TextDecoration.none))),
          Text("Garder un oeil sur votre modulation",
              style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 2,decoration: TextDecoration.none))),
          const SizedBox(height: 100),
          SpinKitRipple(color: Theme.of(context).primaryColor, size: 100.0)
        ],
      )
    );
  }
}
