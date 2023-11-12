import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Theme/colors.dart';


class CustomTextFieldFooter extends StatefulWidget {
  const CustomTextFieldFooter({Key? key,required this.titre, required this.controllerTot,required this.controllerNotif, required this.labelTextResult, this.functionTotal}) : super(key: key);

  final TextEditingController controllerTot;
  final TextEditingController controllerNotif;
  final String labelTextResult;
  final String titre;
  final void Function()? functionTotal;

  @override
  State<CustomTextFieldFooter> createState() => _CustomTextFieldFooterState();
}

class _CustomTextFieldFooterState extends State<CustomTextFieldFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(
              width: MediaQuery.of(context).size.width /4,
              child: Text( widget.titre , style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none)))),
          SizedBox(
            width: MediaQuery.of(context).size.width /4,
            height: 30,
            child: IgnorePointer(
              child: TextFormField(
                controller: widget.controllerTot,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 15,letterSpacing: 1,decoration: TextDecoration.none)),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.0)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: widget.labelTextResult
                ),
              ),
            ),
          ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
              onPressed: widget.functionTotal,
              child: Text( "Valider", style: GoogleFonts.poppins(textStyle: const TextStyle(color: white,fontSize: 13,letterSpacing: 1,decoration: TextDecoration.none))),
            )

          ],),
        const SizedBox(height:30),
        SizedBox(
          width: MediaQuery.of(context).size.width -40,
          child: TextFormField(
            controller: widget.controllerNotif,
            minLines: 4,
            maxLines: 4,
            style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 13)),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0)),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              hintText: 'Notification',
              hintStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,decoration: TextDecoration.none)),
            ),
          ),
        ),
      ],
    );
  }
}
