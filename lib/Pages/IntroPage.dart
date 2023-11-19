import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'HomePage.dart';



class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Center(
          child: SizedBox(
            height:200,
            width: 200,
            child: Image.asset("assets/images/logo.png",fit: BoxFit.cover)
                .animate().fade(begin: 0.1,end: 1,duration: 1000.ms,delay: 600.ms)
                .slideY(begin: -1,end: 0,duration: 1000.ms,delay: 600.ms) ,
          ),
        ),
      ).animate().fade(delay: 500.ms)
    );
  }
}
