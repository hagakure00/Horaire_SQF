import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Theme/colors.dart';




class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key,
    required this.jour,
    required this.controllerArr,
    required this.functionArr,
    required this.controllerDep,
    required this.functionDep,
    required this.controllerTot,
    required this.functionTot,
    required this.labelTextResult,
  }) : super(key: key);

  final TextEditingController controllerArr;
  final TextEditingController controllerDep;
  final TextEditingController controllerTot;
  final String labelTextResult;
  final String jour;
  final void Function(String) functionArr;
  final void Function(String)functionDep;
  final void Function(String) functionTot;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width /6, child: null,),
              SizedBox(
                  width: MediaQuery.of(context).size.width /5,
                  child: Text("Arrivée", style: GoogleFonts.poppins(textStyle: const TextStyle(color: grey,fontSize: 12,decoration: TextDecoration.none)))),
              SizedBox(
                  width: MediaQuery.of(context).size.width /5,
                  child: Text("Départ", style: GoogleFonts.poppins(textStyle: const TextStyle(color: grey,fontSize: 12,decoration: TextDecoration.none)))),
              SizedBox(
                  width: MediaQuery.of(context).size.width /5,
                  child: Text("Total", style: GoogleFonts.poppins(textStyle: const TextStyle(color: grey,fontSize: 12,decoration: TextDecoration.none)))),


            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width /6,
                child: Text(widget.jour , style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none)))),
            SizedBox(
              width: MediaQuery.of(context).size.width /5,
              height: 30,
              child: TextFormField(
                controller: widget.controllerArr,
                onChanged: widget.functionArr,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 14,letterSpacing: 1,decoration: TextDecoration.none)),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                ),

              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width /5,
              height: 30,
              child: TextFormField(
                controller: widget.controllerDep,
                onChanged: widget.functionDep,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 14,letterSpacing: 1,decoration: TextDecoration.none)),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width /5,
              height: 30,
              child: TextFormField(
                controller: widget.controllerTot,
                onChanged: widget.functionTot,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 14,letterSpacing: 1,decoration: TextDecoration.none)),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: widget.labelTextResult,
                  labelStyle: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 14,decoration: TextDecoration.none)),
                ),
              ),
            ),
          ],)
      ],
    );
}
}

