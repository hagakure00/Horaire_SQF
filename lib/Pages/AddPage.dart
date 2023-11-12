import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Models/HoraireModel.dart';
import 'package:horaire/Pages/HomePage.dart';
import 'package:horaire/Theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../Services/DatabaseHoraire.dart';
import '../Services/DatabaseUser.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key, required this.valuePause, required this.valueContrat}) : super(key: key);

  final String? valuePause;
  final String? valueContrat;

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  final _formKey = GlobalKey<FormState>();
  DBHelperHoraire? dbHelperHoraire;
  DBHelperUser? dbHelperUser;
  Database? db;

  late final contratController = TextEditingController(text: widget.valueContrat);
  late final pauseController = TextEditingController(text: widget.valuePause);
  late final moisController = TextEditingController(text: "");
  late final moduleController = TextEditingController(text: "");


  @override
  void initState() {
    super.initState();
    dbHelperHoraire = DBHelperHoraire();
    dbHelperUser = DBHelperUser();
    getModule();
    getDate();
  }


String? getValue;
getModule() {
  setState(() {
    dbHelperHoraire!.getData().then((value){
      getValue = (value.isEmpty) ? "0" : value;
      double val = double.parse(getValue!);
      String valFormated = val.toStringAsFixed(2);
      setState(() {
       moduleController.text = valFormated;
      });
      if (kDebugMode) {
        print(getValue);
      }
    });
  });
  }

  String? dateMonthFormated;
  String? dateYearFormated;
  Future<void> getDate() async {
      String dateMonth = DateFormat('MM').format(DateTime.now());
      String dateYear = DateFormat('yyyy').format(DateTime.now());

      String val = "";
      var value = dateMonth;
      switch (value) {
        case "1": { val = "Janvier";}
        break;
        case "2": { val = "Février";}
        break;
        case "3": {val = "Mars";}
        break;
        case "4": { val = "Avril";}
        break;
        case "5": { val = "Mai";}
        break;
        case "6": {val = "Juin";}
        break;
        case "7": { val = "Juillet";}
        break;
        case "8": { val = "Août";}
        break;
        case "9": {val = "Septembre";}
        break;
        case "10": { val = "Octobre";}
        break;
        case "11": { val = "Novembre";}
        break;
        case "12": {val = "Décembre";}
        break;
        default: {}
        break;
      }
      dateMonthFormated = val;
      dateYearFormated = dateYear;
      setState(() {
        moisController.text = "${dateMonthFormated!} ${dateYearFormated!}";
      });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  buildHeader(),
                  buildMois(),
                  const SizedBox(height: 50),
                  buildModule(),
                  const SizedBox(height: 80),
                  // button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {Navigator.of(context).pop();},
                          style: ElevatedButton.styleFrom(backgroundColor: grey),
                          child: Text("Retour",style: GoogleFonts.poppins( textStyle: const TextStyle(color: white,fontSize: 13,decoration: TextDecoration.none)),)
                      ),

                      validateForm()
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildMois() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Ajouter le nom du mois", style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 1,decoration: TextDecoration.none))),
            ]),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
              style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 13,decoration: TextDecoration.none)),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              cursorColor: Theme.of(context).primaryColor,
              controller: moisController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Valeur obligatoire';
                } else {
                  return null;
                }
              }
          ),
        ),
      ],
    );
  }

  Widget buildModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Ajouter votre dernière modulation",
                  style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 1,decoration: TextDecoration.none))),
              const SizedBox(height: 8),
              Text("Modulation de fin de mois précédent",
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.red.withOpacity(0.8),fontSize: 12,height: 1,decoration: TextDecoration.none))),
            ]),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
             child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0)),
                fillColor: Colors.grey.withOpacity(0.1),
                filled: true,
              ),
              style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 13,letterSpacing: 1,decoration: TextDecoration.none)),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              cursorColor: Theme.of(context).primaryColor,
              controller: moduleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Valeur obligatoire';
                } else {
                  return null;
                }
              }
          ),
        )
      ],
    );
  }

  Widget buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(child: Text("Ajouter un mois",
            style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 35,letterSpacing: 0.5,height: 1,decoration: TextDecoration.none))),
        ),
        const SizedBox(height: 10),
        Center(child: Text("Paramètres minimum requis",
            style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 1,decoration: TextDecoration.none))),
        ),
        const SizedBox(height: 60),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 100,
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 87,
            initialSelectedDate: DateTime.now(),
            selectedTextColor: white,
            selectionColor: Theme.of(context).primaryColor,
            dateTextStyle: GoogleFonts.oswald(textStyle: const TextStyle(color: black,fontSize: 23,height: 1,decoration: TextDecoration.none)),
            monthTextStyle: GoogleFonts.oswald(textStyle: const TextStyle(color: black,fontSize: 16,height: 1,decoration: TextDecoration.none)),
            dayTextStyle: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 12,height: 1,decoration: TextDecoration.none)),
            daysCount: 7,
            locale: "fr_FR",
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  validateForm() {
    return ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()){
            dbHelperHoraire!.insertData(HoraireModel(
                  mois: moisController.text,
                  date: DateFormat('yMd').add_jm().format(DateTime.now()).toString(),
                  contratHoraire: contratController.text,
                  tempsPause: pauseController.text,
                  module: moduleController.text,

                s1d1a: "",
                s1d1d: "",
                s1d1t: "",
                s1d2a: "",
                s1d2d: "",
                s1d2t: "",
                s1d3a: "",
                s1d3d: "",
                s1d3t: "",
                s1d4a: "",
                s1d4d: "",
                s1d4t: "",
                s1d5a: "",
                s1d5d: "",
                s1d5t: "",
                s1d6a: "",
                s1d6d: "",
                s1d6t: "",
                totals1: "",
                s2d1a: "",
                s2d1d: "",
                s2d1t: "",
                s2d2a: "",
                s2d2d: "",
                s2d2t: "",
                s2d3a: "",
                s2d3d: "",
                s2d3t: "",
                s2d4a: "",
                s2d4d: "",
                s2d4t: "",
                s2d5a: "",
                s2d5d: "",
                s2d5t: "",
                s2d6a: "",
                s2d6d: "",
                s2d6t: "",
                totals2: "",
                s3d1a: "",
                s3d1d: "",
                s3d1t: "",
                s3d2a: "",
                s3d2d: "",
                s3d2t: "",
                s3d3a: "",
                s3d3d: "",
                s3d3t: "",
                s3d4a: "",
                s3d4d: "",
                s3d4t: "",
                s3d5a: "",
                s3d5d: "",
                s3d5t: "",
                s3d6a: "",
                s3d6d: "",
                s3d6t: "",
                totals3: "",
                s4d1a: "",
                s4d1d: "",
                s4d1t: "",
                s4d2a: "",
                s4d2d: "",
                s4d2t: "",
                s4d3a: "",
                s4d3d: "",
                s4d3t: "",
                s4d4a: "",
                s4d4d: "",
                s4d4t: "",
                s4d5a: "",
                s4d5d: "",
                s4d5t: "",
                s4d6a: "",
                s4d6d: "",
                s4d6t: "",
                totals4: "",
                s5d1a: "",
                s5d1d: "",
                s5d1t: "",
                s5d2a: "",
                s5d2d: "",
                s5d2t: "",
                s5d3a: "",
                s5d3d: "",
                s5d3t: "",
                s5d4a: "",
                s5d4d: "",
                s5d4t: "",
                s5d5a: "",
                s5d5d: "",
                s5d5t: "",
                s5d6a: "",
                s5d6d: "",
                s5d6t: "",
                totals5: "",

                notifs1: "",
                notifs2: "",
                notifs3: "",
                notifs4: "",
                notifs5: "",

                totalHeureDuMois: "",
                totalModuleDuMois: "",
                absence: "",
                heureSup: "",
                congePaye: "",

                cpS1j1: "0",
                cpS1j2: "0",
                cpS1j3: "0",
                cpS1j4: "0",
                cpS1j5: "0",
                cpS2j1: "0",
                cpS2j2: "0",
                cpS2j3: "0",
                cpS2j4: "0",
                cpS2j5: "0",
                cpS3j1: "0",
                cpS3j2: "0",
                cpS3j3: "0",
                cpS3j4: "0",
                cpS3j5: "0",
                cpS4j1: "0",
                cpS4j2: "0",
                cpS4j3: "0",
                cpS4j4: "0",
                cpS4j5: "0",
                cpS5j1: "0",
                cpS5j2: "0",
                cpS5j3: "0",
                cpS5j4: "0",
                cpS5j5: "0",

              ));
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
              moisController.clear();
              moduleController.clear();
            if (kDebugMode) {
              print("data added");
            }
          }
          return;
        },
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
        child: Text("Valider",style: GoogleFonts.poppins( textStyle: const TextStyle(color: white,fontSize: 13,decoration: TextDecoration.none)),)
    );
  }
}

