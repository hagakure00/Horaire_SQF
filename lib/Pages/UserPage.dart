import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Models/UserModel.dart';
import 'package:horaire/Pages/HomePage.dart';
import 'package:horaire/Services/DatabaseHoraire.dart';
import 'package:horaire/Theme/colors.dart';
import 'package:theme_provider/theme_provider.dart';
import '../Services/DatabaseUser.dart';


class UserPage extends StatefulWidget {
  const UserPage(
      {Key? key,
      required this.isUpdate,
      required this.pause,
      required this.contrat,
      required this.samedi})
      : super(key: key);

  final bool? isUpdate;
  final String? pause;
  final String? contrat;
  final String? samedi;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  DBHelperUser? dbHelperUser;
  DBHelperHoraire? dbHelperHoraire;
  late Future<List<UserModel>> dataUserList;

  late final contratController = TextEditingController(text: widget.contrat);
  late final pauseController = TextEditingController(text: widget.pause);

  late bool isSelectedSamedi = (widget.samedi == "1") ? true :false;
  late String samCheck = (widget.samedi == "1") ? "1" : "0";

  @override
  void initState() {
    super.initState();
    dbHelperUser = DBHelperUser();
    dbHelperHoraire = DBHelperHoraire();
  }

  int _selectedHoraire = 0;
  String message = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text("Mes Horaires",
            style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                    color: black,
                    fontSize: 18,
                    letterSpacing: 0.5,
                    height: 1,
                    decoration: TextDecoration.none))),
        actions: [
          IconButton(
              onPressed: () async {
                await dbHelperHoraire?.backUpDb();
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("La base de données a bien été enregistré ...",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  decoration: TextDecoration.none))),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                });
              },
              icon: const Icon(Icons.save, color: grey, size: 20))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  buildHeader(context),
                  buildContratCase(context),
                  const SizedBox(height: 30),
                  buildContrat(context),
                  const SizedBox(height: 30),
                  buildPause(context),
                  const SizedBox(height: 20),
                  buildSamediCheck(),
                  const SizedBox(height: 20),
                  buildThemeColor(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          style:
                              ElevatedButton.styleFrom(backgroundColor: grey),
                          child: Text(
                            'Retour',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: white,
                                    fontSize: 13,
                                    decoration: TextDecoration.none)),
                          )),
                      validateForm(context)
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

  Widget buildSamediCheck() {
    return Row(
      children: [
        Text("Calculer les Samedi séparement :", style: GoogleFonts.poppins(textStyle: const TextStyle(color: black, fontSize: 14, height: 1, decoration: TextDecoration.none))),
        SizedBox(width: MediaQuery.of(context).size.width -350),
        Switch(
            activeColor: Theme.of(context).primaryColor,
            value: isSelectedSamedi,
            onChanged: (e) {
              setState(() {
                isSelectedSamedi = e;
                samCheck = isSelectedSamedi == true ? "1" : "0";
              });
            }
        )
      ],
    );
  }

  Widget buildThemeColor(){
    return Row(
      children: [
        Text("Changer le Theme :    ", style: GoogleFonts.poppins(textStyle: const TextStyle(color: black, fontSize: 14, height: 1, decoration: TextDecoration.none))),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {ThemeProvider.controllerOf(context).setTheme("blue");ThemeProvider.controllerOf(context).saveThemeToDisk();},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: primary,borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        GestureDetector(
          onTap: () {ThemeProvider.controllerOf(context).setTheme("orange");ThemeProvider.controllerOf(context).saveThemeToDisk();},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        GestureDetector(
          onTap: () {ThemeProvider.controllerOf(context).setTheme("purple");ThemeProvider.controllerOf(context).saveThemeToDisk();},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        GestureDetector(
          onTap: () {ThemeProvider.controllerOf(context).setTheme("green");ThemeProvider.controllerOf(context).saveThemeToDisk();},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
        GestureDetector(
          onTap: () {ThemeProvider.controllerOf(context).setTheme("red");ThemeProvider.controllerOf(context).saveThemeToDisk();},
          child: Container(
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ],
    );
  }

  Widget buildContratCase(context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Selectionner votre Contrat horaire",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: black,
                      fontSize: 14,
                      height: 1,
                      decoration: TextDecoration.none))),
        ]),
        const SizedBox(height: 20),
        Wrap(
            children: List.generate(2, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedHoraire =  index;
                contratController.text = (_selectedHoraire == 0) ? "151.67" : "173.33";
              });
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  side: _selectedHoraire == index
                      ? BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.8), width: 2)
                      : const BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.circular(3),
                ),
                margin: const EdgeInsets.all(10),
                color: white,
                shadowColor: Colors.black,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: index == 0 ? Text("35 heures",
                          style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  decoration: TextDecoration.none)))
                         : Text("40 heures",
                          style: GoogleFonts.oswald(
                              textStyle: const TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  decoration: TextDecoration.none))),
                )),
          );
        })),
      ],
    );
  }

  Widget buildContrat(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Ou ajouter votre Contrat Horaire par Année",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: black,
                          fontSize: 14,
                          height: 1,
                          decoration: TextDecoration.none))),
              const SizedBox(height: 8),
              Text("ex: 151.67 pour 35h par semaine (en centième)",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.red.withOpacity(0.8),
                          fontSize: 12,
                          height: 1,
                          decoration: TextDecoration.none))),
            ]),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0)),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
          ),
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: black,
                  fontSize: 13,
                  letterSpacing: 1,
                  decoration: TextDecoration.none)),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          cursorColor: Theme.of(context).primaryColor,
          controller: contratController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (e) {
            if (e!.isEmpty) {
              return "Valeur obligatoire";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildPause(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Ajouter votre temps de pause par jour",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: black,
                          fontSize: 14,
                          height: 1,
                          decoration: TextDecoration.none))),
              const SizedBox(height: 8),
              Text("ex : 1.25 pour 1 heure et 15mn par jour (en centième)",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.red.withOpacity(0.8),
                          fontSize: 12,
                          height: 1,
                          decoration: TextDecoration.none))),
            ]),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0)),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
          ),
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: black,
                  fontSize: 13,
                  letterSpacing: 1,
                  decoration: TextDecoration.none)),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          cursorColor: Theme.of(context).primaryColor,
          controller: pauseController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (e) {
            if (e!.isEmpty) {
              return "Valeur obligatoire";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget buildHeader(context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: Text("Paramètres Utilisateur",
              style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 35,
                      letterSpacing: 0.5,
                      height: 1.5,
                      decoration: TextDecoration.none))),
        ),
        Center(
          child: Text("Paramètres minimum requis",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: black,
                      fontSize: 14,
                      height: 1,
                      decoration: TextDecoration.none))),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  validateForm(context) {
    return ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (widget.isUpdate == true) {
              dbHelperUser!.updateDataUser(UserModel(
                contrat: contratController.text,
                pause: pauseController.text,
                samCheck: samCheck
              ));
            } else {
              dbHelperUser!.insertDataUser(UserModel(
                contrat: contratController.text,
                pause: pauseController.text,
                samCheck: samCheck
              ));
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            contratController.clear();
            pauseController.clear();
            if (kDebugMode) {
              print("data added");
            }
          }
          return;
        },
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
        child: Text(
          "Valider",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: white, fontSize: 13, decoration: TextDecoration.none)),
        ));
  }
}

