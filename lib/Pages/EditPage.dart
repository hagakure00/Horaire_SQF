import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Animation/FadeAnimation.dart';
import 'package:horaire/Models/HoraireModel.dart';
import 'package:horaire/Theme/colors.dart';
import 'package:horaire/Widgets/CustomTextfield.dart';
import 'package:horaire/Widgets/CustomTextfieldFooter.dart';
import 'package:intl/intl.dart';
import '../Services/DatabaseHoraire.dart';
import 'HomePage.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key, required this.horaire}) : super(key: key);
  final HoraireModel horaire;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();
  DBHelperHoraire? dbHelper;

  late String moyenneCP;

  late bool isSelectedS1j1 = (widget.horaire.cpS1j1 == "1") ? true :false;
  late bool isSelectedS1j2 = (widget.horaire.cpS1j2 == "1") ? true :false;
  late bool isSelectedS1j3 = (widget.horaire.cpS1j3 == "1") ? true :false;
  late bool isSelectedS1j4 = (widget.horaire.cpS1j4 == "1") ? true :false;
  late bool isSelectedS1j5 = (widget.horaire.cpS1j5 == "1") ? true :false;

  late bool isSelectedS2j1 = (widget.horaire.cpS2j1 == "1") ? true :false;
  late bool isSelectedS2j2 = (widget.horaire.cpS2j2 == "1") ? true :false;
  late bool isSelectedS2j3 = (widget.horaire.cpS2j3 == "1") ? true :false;
  late bool isSelectedS2j4 = (widget.horaire.cpS2j4 == "1") ? true :false;
  late bool isSelectedS2j5 = (widget.horaire.cpS2j5 == "1") ? true :false;

  late bool isSelectedS3j1 = (widget.horaire.cpS3j1 == "1") ? true :false;
  late bool isSelectedS3j2 = (widget.horaire.cpS3j2 == "1") ? true :false;
  late bool isSelectedS3j3 = (widget.horaire.cpS3j3 == "1") ? true :false;
  late bool isSelectedS3j4 = (widget.horaire.cpS3j4 == "1") ? true :false;
  late bool isSelectedS3j5 = (widget.horaire.cpS3j5 == "1") ? true :false;

  late bool isSelectedS4j1 = (widget.horaire.cpS4j1 == "1") ? true :false;
  late bool isSelectedS4j2 = (widget.horaire.cpS4j2 == "1") ? true :false;
  late bool isSelectedS4j3 = (widget.horaire.cpS4j3 == "1") ? true :false;
  late bool isSelectedS4j4 = (widget.horaire.cpS4j4 == "1") ? true :false;
  late bool isSelectedS4j5 = (widget.horaire.cpS4j5 == "1") ? true :false;

  late bool isSelectedS5j1 = (widget.horaire.cpS5j1 == "1") ? true :false;
  late bool isSelectedS5j2 = (widget.horaire.cpS5j2 == "1") ? true :false;
  late bool isSelectedS5j3 = (widget.horaire.cpS5j3 == "1") ? true :false;
  late bool isSelectedS5j4 = (widget.horaire.cpS5j4 == "1") ? true :false;
  late bool isSelectedS5j5 = (widget.horaire.cpS5j5 == "1") ? true :false;

  late String checkS1j1 = (widget.horaire.cpS1j1 == "1") ? "1" : "0";
  late String checkS1j2 = (widget.horaire.cpS1j2 == "1") ? "1" : "0";
  late String checkS1j3 = (widget.horaire.cpS1j3 == "1") ? "1" : "0";
  late String checkS1j4 = (widget.horaire.cpS1j4 == "1") ? "1" : "0";
  late String checkS1j5 = (widget.horaire.cpS1j5 == "1") ? "1" : "0";

  late String checkS2j1 = (widget.horaire.cpS2j1 == "1") ? "1" : "0";
  late String checkS2j2 = (widget.horaire.cpS2j2 == "1") ? "1" : "0";
  late String checkS2j3 = (widget.horaire.cpS2j3 == "1") ? "1" : "0";
  late String checkS2j4 = (widget.horaire.cpS2j4 == "1") ? "1" : "0";
  late String checkS2j5 = (widget.horaire.cpS2j5 == "1") ? "1" : "0";

  late String checkS3j1 = (widget.horaire.cpS3j1 == "1") ? "1" : "0";
  late String checkS3j2 = (widget.horaire.cpS3j2 == "1") ? "1" : "0";
  late String checkS3j3 = (widget.horaire.cpS3j3 == "1") ? "1" : "0";
  late String checkS3j4 = (widget.horaire.cpS3j4 == "1") ? "1" : "0";
  late String checkS3j5 = (widget.horaire.cpS3j5 == "1") ? "1" : "0";

  late String checkS4j1 = (widget.horaire.cpS4j1 == "1") ? "1" : "0";
  late String checkS4j2 = (widget.horaire.cpS4j2 == "1") ? "1" : "0";
  late String checkS4j3 = (widget.horaire.cpS4j3 == "1") ? "1" : "0";
  late String checkS4j4 = (widget.horaire.cpS4j4 == "1") ? "1" : "0";
  late String checkS4j5 = (widget.horaire.cpS4j5 == "1") ? "1" : "0";

  late String checkS5j1 = (widget.horaire.cpS5j1 == "1") ? "1" : "0";
  late String checkS5j2 = (widget.horaire.cpS5j2 == "1") ? "1" : "0";
  late String checkS5j3 = (widget.horaire.cpS5j3 == "1") ? "1" : "0";
  late String checkS5j4 = (widget.horaire.cpS5j4 == "1") ? "1" : "0";
  late String checkS5j5 = (widget.horaire.cpS5j5 == "1") ? "1" : "0";


  @override
  void initState() {
    super.initState();
    dbHelper = DBHelperHoraire();
  }

  late final cpS1j1 = TextEditingController(text: widget.horaire.cpS1j1);
  late final cpS1j2 = TextEditingController(text: widget.horaire.cpS1j2);
  late final cpS1j3 = TextEditingController(text: widget.horaire.cpS1j3);
  late final cpS1j4 = TextEditingController(text: widget.horaire.cpS1j4);
  late final cpS1j5 = TextEditingController(text: widget.horaire.cpS1j5);

  late final cpS2j1 = TextEditingController(text: widget.horaire.cpS2j1);
  late final cpS2j2 = TextEditingController(text: widget.horaire.cpS2j2);
  late final cpS2j3 = TextEditingController(text: widget.horaire.cpS2j3);
  late final cpS2j4 = TextEditingController(text: widget.horaire.cpS2j4);
  late final cpS2j5 = TextEditingController(text: widget.horaire.cpS2j5);

  late final cpS3j1 = TextEditingController(text: widget.horaire.cpS3j1);
  late final cpS3j2 = TextEditingController(text: widget.horaire.cpS3j2);
  late final cpS3j3 = TextEditingController(text: widget.horaire.cpS3j3);
  late final cpS3j4 = TextEditingController(text: widget.horaire.cpS3j4);
  late final cpS3j5 = TextEditingController(text: widget.horaire.cpS3j5);

  late final cpS4j1 = TextEditingController(text: widget.horaire.cpS4j1);
  late final cpS4j2 = TextEditingController(text: widget.horaire.cpS4j2);
  late final cpS4j3 = TextEditingController(text: widget.horaire.cpS4j3);
  late final cpS4j4 = TextEditingController(text: widget.horaire.cpS4j4);
  late final cpS4j5 = TextEditingController(text: widget.horaire.cpS4j5);

  late final cpS5j1 = TextEditingController(text: widget.horaire.cpS5j1);
  late final cpS5j2 = TextEditingController(text: widget.horaire.cpS5j2);
  late final cpS5j3 = TextEditingController(text: widget.horaire.cpS5j3);
  late final cpS5j4 = TextEditingController(text: widget.horaire.cpS5j4);
  late final cpS5j5 = TextEditingController(text: widget.horaire.cpS5j5);

  late final contratHoraire = TextEditingController(text: widget.horaire.contratHoraire);
  late final tempsPause = TextEditingController(text: widget.horaire.tempsPause);

  late final moisController = TextEditingController(text: widget.horaire.mois);
  late final moduleController = TextEditingController(text: widget.horaire.module);

  late final s1d1a = TextEditingController(text: widget.horaire.s1d1a);
  late final s1d2a = TextEditingController(text: widget.horaire.s1d2a);
  late final s1d3a = TextEditingController(text: widget.horaire.s1d3a);
  late final s1d4a = TextEditingController(text: widget.horaire.s1d4a);
  late final s1d5a = TextEditingController(text: widget.horaire.s1d5a);
  late final s1d6a = TextEditingController(text: widget.horaire.s1d6a);
  late final s1d1d = TextEditingController(text: widget.horaire.s1d1d);
  late final s1d2d = TextEditingController(text: widget.horaire.s1d2d);
  late final s1d3d = TextEditingController(text: widget.horaire.s1d3d);
  late final s1d4d = TextEditingController(text: widget.horaire.s1d4d);
  late final s1d5d = TextEditingController(text: widget.horaire.s1d5d);
  late final s1d6d = TextEditingController(text: widget.horaire.s1d6d);
  late final s1d1t = TextEditingController(text: widget.horaire.s1d1t);
  late final s1d2t = TextEditingController(text: widget.horaire.s1d2t);
  late final s1d3t = TextEditingController(text: widget.horaire.s1d3t);
  late final s1d4t = TextEditingController(text: widget.horaire.s1d4t);
  late final s1d5t = TextEditingController(text: widget.horaire.s1d5t);
  late final s1d6t = TextEditingController(text: widget.horaire.s1d6t);
  late final totals1 = TextEditingController(text: widget.horaire.totals1);

  late final s2d1a = TextEditingController(text: widget.horaire.s2d1a);
  late final s2d2a = TextEditingController(text: widget.horaire.s2d2a);
  late final s2d3a = TextEditingController(text: widget.horaire.s2d3a);
  late final s2d4a = TextEditingController(text: widget.horaire.s2d4a);
  late final s2d5a = TextEditingController(text: widget.horaire.s2d5a);
  late final s2d6a = TextEditingController(text: widget.horaire.s2d6a);
  late final s2d1d = TextEditingController(text: widget.horaire.s2d1d);
  late final s2d2d = TextEditingController(text: widget.horaire.s2d2d);
  late final s2d3d = TextEditingController(text: widget.horaire.s2d3d);
  late final s2d4d = TextEditingController(text: widget.horaire.s2d4d);
  late final s2d5d = TextEditingController(text: widget.horaire.s2d5d);
  late final s2d6d = TextEditingController(text: widget.horaire.s2d6d);
  late final s2d1t = TextEditingController(text: widget.horaire.s2d1t);
  late final s2d2t = TextEditingController(text: widget.horaire.s2d2t);
  late final s2d3t = TextEditingController(text: widget.horaire.s2d3t);
  late final s2d4t = TextEditingController(text: widget.horaire.s2d4t);
  late final s2d5t = TextEditingController(text: widget.horaire.s2d5t);
  late final s2d6t = TextEditingController(text: widget.horaire.s2d6t);
  late final totals2 = TextEditingController(text: widget.horaire.totals2);

  late final s3d1a = TextEditingController(text: widget.horaire.s3d1a);
  late final s3d2a = TextEditingController(text: widget.horaire.s3d2a);
  late final s3d3a = TextEditingController(text: widget.horaire.s3d3a);
  late final s3d4a = TextEditingController(text: widget.horaire.s3d4a);
  late final s3d5a = TextEditingController(text: widget.horaire.s3d5a);
  late final s3d6a = TextEditingController(text: widget.horaire.s3d6a);
  late final s3d1d = TextEditingController(text: widget.horaire.s3d1d);
  late final s3d2d = TextEditingController(text: widget.horaire.s3d2d);
  late final s3d3d = TextEditingController(text: widget.horaire.s3d3d);
  late final s3d4d = TextEditingController(text: widget.horaire.s3d4d);
  late final s3d5d = TextEditingController(text: widget.horaire.s3d5d);
  late final s3d6d = TextEditingController(text: widget.horaire.s3d6d);
  late final s3d1t = TextEditingController(text: widget.horaire.s3d1t);
  late final s3d2t = TextEditingController(text: widget.horaire.s3d2t);
  late final s3d3t = TextEditingController(text: widget.horaire.s3d3t);
  late final s3d4t = TextEditingController(text: widget.horaire.s3d4t);
  late final s3d5t = TextEditingController(text: widget.horaire.s3d5t);
  late final s3d6t = TextEditingController(text: widget.horaire.s3d6t);
  late final totals3 = TextEditingController(text: widget.horaire.totals3);

  late final s4d1a = TextEditingController(text: widget.horaire.s4d1a);
  late final s4d2a = TextEditingController(text: widget.horaire.s4d2a);
  late final s4d3a = TextEditingController(text: widget.horaire.s4d3a);
  late final s4d4a = TextEditingController(text: widget.horaire.s4d4a);
  late final s4d5a = TextEditingController(text: widget.horaire.s4d5a);
  late final s4d6a = TextEditingController(text: widget.horaire.s4d6a);
  late final s4d1d = TextEditingController(text: widget.horaire.s4d1d);
  late final s4d2d = TextEditingController(text: widget.horaire.s4d2d);
  late final s4d3d = TextEditingController(text: widget.horaire.s4d3d);
  late final s4d4d = TextEditingController(text: widget.horaire.s4d4d);
  late final s4d5d = TextEditingController(text: widget.horaire.s4d5d);
  late final s4d6d = TextEditingController(text: widget.horaire.s4d6d);
  late final s4d1t = TextEditingController(text: widget.horaire.s4d1t);
  late final s4d2t = TextEditingController(text: widget.horaire.s4d2t);
  late final s4d3t = TextEditingController(text: widget.horaire.s4d3t);
  late final s4d4t = TextEditingController(text: widget.horaire.s4d4t);
  late final s4d5t = TextEditingController(text: widget.horaire.s4d5t);
  late final s4d6t = TextEditingController(text: widget.horaire.s4d6t);
  late final totals4 = TextEditingController(text: widget.horaire.totals4);

  late final s5d1a = TextEditingController(text: widget.horaire.s5d1a);
  late final s5d2a = TextEditingController(text: widget.horaire.s5d2a);
  late final s5d3a = TextEditingController(text: widget.horaire.s5d3a);
  late final s5d4a = TextEditingController(text: widget.horaire.s5d4a);
  late final s5d5a = TextEditingController(text: widget.horaire.s5d5a);
  late final s5d6a = TextEditingController(text: widget.horaire.s5d6a);
  late final s5d1d = TextEditingController(text: widget.horaire.s5d1d);
  late final s5d2d = TextEditingController(text: widget.horaire.s5d2d);
  late final s5d3d = TextEditingController(text: widget.horaire.s5d3d);
  late final s5d4d = TextEditingController(text: widget.horaire.s5d4d);
  late final s5d5d = TextEditingController(text: widget.horaire.s5d5d);
  late final s5d6d = TextEditingController(text: widget.horaire.s5d6d);
  late final s5d1t = TextEditingController(text: widget.horaire.s5d1t);
  late final s5d2t = TextEditingController(text: widget.horaire.s5d2t);
  late final s5d3t = TextEditingController(text: widget.horaire.s5d3t);
  late final s5d4t = TextEditingController(text: widget.horaire.s5d4t);
  late final s5d5t = TextEditingController(text: widget.horaire.s5d5t);
  late final s5d6t = TextEditingController(text: widget.horaire.s5d6t);
  late final totals5 = TextEditingController(text: widget.horaire.totals5);

  late final notifs1 = TextEditingController(text: widget.horaire.notifs1);
  late final notifs2 = TextEditingController(text: widget.horaire.notifs2);
  late final notifs3 = TextEditingController(text: widget.horaire.notifs3);
  late final notifs4 = TextEditingController(text: widget.horaire.notifs4);
  late final notifs5 = TextEditingController(text: widget.horaire.notifs5);

  late final totalHeureDuMois = TextEditingController(text: widget.horaire.totalHeureDuMois);
  late final totalModuleDuMois = TextEditingController(text: widget.horaire.totalModuleDuMois);
  late final heureAbsence = TextEditingController(text: widget.horaire.absence);
  late final heureSup = TextEditingController(text: widget.horaire.heureSup);
  late final congePaye = TextEditingController(text: widget.horaire.congePaye);

  /////////////////
  // calcul
  ////////////////

  double timepause = 0.0; double zero = 0.0;

  double s1j1anum = 0.0, s1j1dnum = 0.0, s1j2anum = 0.0, s1j2dnum = 0.0, s1j3anum = 0.0, s1j3dnum = 0.0, s1j4anum = 0.0, s1j4dnum = 0.0, s1j5anum = 0.0, s1j5dnum = 0.0, s1j6anum = 0.0, s1j6dnum = 0.0;
  double s1j1tnum = 0.0, s1j2tnum = 0.0, s1j3tnum = 0.0, s1j4tnum = 0.0, s1j5tnum = 0.0, s1j6tnum = 0.0, totals1num = 0.0;
  /////////////////
  double s2j1anum = 0.0, s2j1dnum = 0.0, s2j2anum = 0.0, s2j2dnum = 0.0, s2j3anum = 0.0, s2j3dnum = 0.0, s2j4anum = 0.0, s2j4dnum = 0.0, s2j5anum = 0.0, s2j5dnum = 0.0, s2j6anum = 0.0, s2j6dnum = 0.0;
  double s2j1tnum = 0.0, s2j2tnum = 0.0, s2j3tnum = 0.0, s2j4tnum = 0.0, s2j5tnum = 0.0, s2j6tnum = 0.0, totals2num = 0.0;
  /////////////////
  double s3j1anum = 0.0, s3j1dnum = 0.0, s3j2anum = 0.0, s3j2dnum = 0.0, s3j3anum = 0.0, s3j3dnum = 0.0, s3j4anum = 0.0, s3j4dnum = 0.0, s3j5anum = 0.0, s3j5dnum = 0.0, s3j6anum = 0.0, s3j6dnum = 0.0;
  double s3j1tnum = 0.0, s3j2tnum = 0.0, s3j3tnum = 0.0, s3j4tnum = 0.0, s3j5tnum = 0.0, s3j6tnum = 0.0, totals3num = 0.0;
  ////////////////
  double s4j1anum = 0.0, s4j1dnum = 0.0, s4j2anum = 0.0, s4j2dnum = 0.0, s4j3anum = 0.0, s4j3dnum = 0.0, s4j4anum = 0.0, s4j4dnum = 0.0, s4j5anum = 0.0, s4j5dnum = 0.0, s4j6anum = 0.0, s4j6dnum = 0.0;
  double s4j1tnum = 0.0, s4j2tnum = 0.0, s4j3tnum = 0.0, s4j4tnum = 0.0, s4j5tnum = 0.0, s4j6tnum = 0.0, totals4num = 0.0;
  ////////////////
  double s5j1anum = 0.0, s5j1dnum = 0.0, s5j2anum = 0.0, s5j2dnum = 0.0, s5j3anum = 0.0, s5j3dnum = 0.0, s5j4anum = 0.0, s5j4dnum = 0.0, s5j5anum = 0.0, s5j5dnum = 0.0, s5j6anum = 0.0, s5j6dnum = 0.0;
  double s5j1tnum = 0.0, s5j2tnum = 0.0, s5j3tnum = 0.0, s5j4tnum = 0.0, s5j5tnum = 0.0, s5j6tnum = 0.0, totals5num = 0.0;

  double totalheureMois = 0.0; double totalmoduleMois = 0.0; double moduleprecnum = 0.0; double moyenne = 0.0; double heureAbsenceNum = 0.0; double heureSupNum = 0.0; double congePayeNum = 0.0;

  double moyenneSemaine = 0.0; double moyenneSemaineFormated = 0.0; double absenceS1 = 0.0; double absenceS2 = 0.0; double absenceS3 = 0.0; double absenceS4 = 0.0; double absenceS5 = 0.0; double totalSemAbsence = 0.0;

  moyenneCPCalcul() {
   double moyCP =  double.parse(widget.horaire.contratHoraire.toString())*12/52/5;
   moyenneCP = moyCP.floor().toString();
  }

  additions1j1(dynamic) {
    setState(() {
      s1d1t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j1anum = double.parse(s1d1a.text.isNotEmpty ? s1d1a.text : "0");
      s1j1dnum = double.parse(s1d1d.text.isNotEmpty ? s1d1d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j1tnum = s1j1dnum - s1j1anum - timepause;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  additions1j2(dynamic) {
    setState(() {
      s1d2t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j2anum = double.parse(s1d2a.text.isNotEmpty ? s1d2a.text : "0");
      s1j2dnum = double.parse(s1d2d.text.isNotEmpty ? s1d2d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j2tnum = s1j2dnum - s1j2anum - timepause;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  additions1j3(dynamic) {
    setState(() {
      s1d3t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j3anum = double.parse(s1d3a.text.isNotEmpty ? s1d3a.text : "0");
      s1j3dnum = double.parse(s1d3d.text.isNotEmpty ? s1d3d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j3tnum = s1j3dnum - s1j3anum - timepause;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  additions1j4(dynamic) {
    setState(() {
      s1d4t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j4anum = double.parse(s1d4a.text.isNotEmpty ? s1d4a.text : "0");
      s1j4dnum = double.parse(s1d4d.text.isNotEmpty ? s1d4d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j4tnum = s1j4dnum - s1j4anum - timepause;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  additions1j5(dynamic) {
    setState(() {
      s1d5t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j5anum = double.parse(s1d5a.text.isNotEmpty ? s1d5a.text : "0");
      s1j5dnum = double.parse(s1d5d.text.isNotEmpty ? s1d5d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j5tnum = s1j5dnum - s1j5anum - timepause;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  additions1j6(dynamic) {
    setState(() {
      s1d6t.clear();
      totals1.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s1j6anum = double.parse(s1d6a.text.isNotEmpty ? s1d6a.text : "0");
      s1j6dnum = double.parse(s1d6d.text.isNotEmpty ? s1d6d.text : "0");

      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());

      s1j6tnum = s1j6dnum - s1j6anum;
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }
  clearResults1(dynamic) {
    setState(() {
      totals1.clear();
      s1j1tnum = double.parse(s1d1t.text.isNotEmpty ? s1d1t.text : s1j1tnum.toString());
      s1j2tnum = double.parse(s1d2t.text.isNotEmpty ? s1d2t.text : s1j2tnum.toString());
      s1j3tnum = double.parse(s1d3t.text.isNotEmpty ? s1d3t.text : s1j3tnum.toString());
      s1j4tnum = double.parse(s1d4t.text.isNotEmpty ? s1d4t.text : s1j4tnum.toString());
      s1j5tnum = double.parse(s1d5t.text.isNotEmpty ? s1d5t.text : s1j5tnum.toString());
      s1j6tnum = double.parse(s1d6t.text.isNotEmpty ? s1d6t.text : s1j6tnum.toString());
      totals1num = s1j1tnum + s1j2tnum + s1j3tnum + s1j4tnum + s1j5tnum + s1j6tnum;
    });
  }


  additions2j1(dynamic) {
    setState(() {
      s2d1t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j1anum = double.parse(s2d1a.text.isNotEmpty ? s2d1a.text : "0");
      s2j1dnum = double.parse(s2d1d.text.isNotEmpty ? s2d1d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j1tnum = s2j1dnum - s2j1anum - timepause;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  additions2j2(dynamic) {
    setState(() {
      s2d2t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j2anum = double.parse(s2d2a.text.isNotEmpty ? s2d2a.text : "0");
      s2j2dnum = double.parse(s2d2d.text.isNotEmpty ? s2d2d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j2tnum = s2j2dnum - s2j2anum - timepause;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  additions2j3(dynamic) {
    setState(() {
      s2d3t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j3anum = double.parse(s2d3a.text.isNotEmpty ? s2d3a.text : "0");
      s2j3dnum = double.parse(s2d3d.text.isNotEmpty ? s2d3d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j3tnum = s2j3dnum - s2j3anum - timepause;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  additions2j4(dynamic) {
    setState(() {
      s2d4t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j4anum = double.parse(s2d4a.text.isNotEmpty ? s2d4a.text : "0");
      s2j4dnum = double.parse(s2d4d.text.isNotEmpty ? s2d4d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j4tnum = s2j4dnum - s2j4anum - timepause;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  additions2j5(dynamic) {
    setState(() {
      s2d5t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j5anum = double.parse(s2d5a.text.isNotEmpty ? s2d5a.text : "0");
      s2j5dnum = double.parse(s2d5d.text.isNotEmpty ? s2d5d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j5tnum = s2j5dnum - s2j5anum - timepause;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  additions2j6(dynamic) {
    setState(() {
      s2d6t.clear();
      totals2.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s2j6anum = double.parse(s2d6a.text.isNotEmpty ? s2d6a.text : "0");
      s2j6dnum = double.parse(s2d6d.text.isNotEmpty ? s2d6d.text : "0");

      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());

      s2j6tnum = s2j6dnum - s2j6anum;
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }
  clearResults2(dynamic) {
    setState(() {
      totals2.clear();
      s2j1tnum = double.parse(s2d1t.text.isNotEmpty ? s2d1t.text : s2j1tnum.toString());
      s2j2tnum = double.parse(s2d2t.text.isNotEmpty ? s2d2t.text : s2j2tnum.toString());
      s2j3tnum = double.parse(s2d3t.text.isNotEmpty ? s2d3t.text : s2j3tnum.toString());
      s2j4tnum = double.parse(s2d4t.text.isNotEmpty ? s2d4t.text : s2j4tnum.toString());
      s2j5tnum = double.parse(s2d5t.text.isNotEmpty ? s2d5t.text : s2j5tnum.toString());
      s2j6tnum = double.parse(s2d6t.text.isNotEmpty ? s2d6t.text : s2j6tnum.toString());
      totals2num = s2j1tnum + s2j2tnum + s2j3tnum + s2j4tnum + s2j5tnum + s2j6tnum;
    });
  }

  additions3j1(dynamic) {
    setState(() {
      s3d1t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j1anum = double.parse(s3d1a.text.isNotEmpty ? s3d1a.text : "0");
      s3j1dnum = double.parse(s3d1d.text.isNotEmpty ? s3d1d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j1tnum = s3j1dnum - s3j1anum - timepause;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  additions3j2(dynamic) {
    setState(() {
      s3d2t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j2anum = double.parse(s3d2a.text.isNotEmpty ? s3d2a.text : "0");
      s3j2dnum = double.parse(s3d2d.text.isNotEmpty ? s3d2d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j2tnum = s3j2dnum - s3j2anum - timepause;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  additions3j3(dynamic) {
    setState(() {
      s3d3t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j3anum = double.parse(s3d3a.text.isNotEmpty ? s3d3a.text : "0");
      s3j3dnum = double.parse(s3d3d.text.isNotEmpty ? s3d3d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j3tnum = s3j3dnum - s3j3anum - timepause;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  additions3j4(dynamic) {
    setState(() {
      s3d4t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j4anum = double.parse(s3d4a.text.isNotEmpty ? s3d4a.text : "0");
      s3j4dnum = double.parse(s3d4d.text.isNotEmpty ? s3d4d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j4tnum = s3j4dnum - s3j4anum - timepause;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  additions3j5(dynamic) {
    setState(() {
      s3d5t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j5anum = double.parse(s3d5a.text.isNotEmpty ? s3d5a.text : "0");
      s3j5dnum = double.parse(s3d5d.text.isNotEmpty ? s3d5d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j5tnum = s3j5dnum - s3j5anum - timepause;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  additions3j6(dynamic) {
    setState(() {
      s3d6t.clear();
      totals3.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s3j6anum = double.parse(s3d6a.text.isNotEmpty ? s3d6a.text : "0");
      s3j6dnum = double.parse(s3d6d.text.isNotEmpty ? s3d6d.text : "0");

      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());

      s3j6tnum = s3j6dnum - s3j6anum;
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }
  clearResults3(dynamic) {
    setState(() {
      totals3.clear();
      s3j1tnum = double.parse(s3d1t.text.isNotEmpty ? s3d1t.text : s3j1tnum.toString());
      s3j2tnum = double.parse(s3d2t.text.isNotEmpty ? s3d2t.text : s3j2tnum.toString());
      s3j3tnum = double.parse(s3d3t.text.isNotEmpty ? s3d3t.text : s3j3tnum.toString());
      s3j4tnum = double.parse(s3d4t.text.isNotEmpty ? s3d4t.text : s3j4tnum.toString());
      s3j5tnum = double.parse(s3d5t.text.isNotEmpty ? s3d5t.text : s3j5tnum.toString());
      s3j6tnum = double.parse(s3d6t.text.isNotEmpty ? s3d6t.text : s3j6tnum.toString());
      totals3num = s3j1tnum + s3j2tnum + s3j3tnum + s3j4tnum + s3j5tnum + s3j6tnum;
    });
  }

  additions4j1(dynamic) {
    setState(() {
      s4d1t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j1anum = double.parse(s4d1a.text.isNotEmpty ? s4d1a.text : "0");
      s4j1dnum = double.parse(s4d1d.text.isNotEmpty ? s4d1d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j1tnum = s4j1dnum - s4j1anum - timepause;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  additions4j2(dynamic) {
    setState(() {
      s4d2t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j2anum = double.parse(s4d2a.text.isNotEmpty ? s4d2a.text : "0");
      s4j2dnum = double.parse(s4d2d.text.isNotEmpty ? s4d2d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j2tnum = s4j2dnum - s4j2anum - timepause;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  additions4j3(dynamic) {
    setState(() {
      s4d3t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j3anum = double.parse(s4d3a.text.isNotEmpty ? s4d3a.text : "0");
      s4j3dnum = double.parse(s4d3d.text.isNotEmpty ? s4d3d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j3tnum = s4j3dnum - s4j3anum - timepause;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  additions4j4(dynamic) {
    setState(() {
      s4d4t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j4anum = double.parse(s4d4a.text.isNotEmpty ? s4d4a.text : "0");
      s4j4dnum = double.parse(s4d4d.text.isNotEmpty ? s4d4d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j4tnum = s4j4dnum - s4j4anum - timepause;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  additions4j5(dynamic) {
    setState(() {
      s4d5t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j5anum = double.parse(s4d5a.text.isNotEmpty ? s4d5a.text : "0");
      s4j5dnum = double.parse(s4d5d.text.isNotEmpty ? s4d5d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j5tnum = s4j5dnum - s4j5anum - timepause;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  additions4j6(dynamic) {
    setState(() {
      s4d6t.clear();
      totals4.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s4j6anum = double.parse(s4d6a.text.isNotEmpty ? s4d6a.text : "0");
      s4j6dnum = double.parse(s4d6d.text.isNotEmpty ? s4d6d.text : "0");

      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());

      s4j6tnum = s4j6dnum - s4j6anum;
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }
  clearResults4(dynamic) {
    setState(() {
      totals4.clear();
      s4j1tnum = double.parse(s4d1t.text.isNotEmpty ? s4d1t.text : s4j1tnum.toString());
      s4j2tnum = double.parse(s4d2t.text.isNotEmpty ? s4d2t.text : s4j2tnum.toString());
      s4j3tnum = double.parse(s4d3t.text.isNotEmpty ? s4d3t.text : s4j3tnum.toString());
      s4j4tnum = double.parse(s4d4t.text.isNotEmpty ? s4d4t.text : s4j4tnum.toString());
      s4j5tnum = double.parse(s4d5t.text.isNotEmpty ? s4d5t.text : s4j5tnum.toString());
      s4j6tnum = double.parse(s4d6t.text.isNotEmpty ? s4d6t.text : s4j6tnum.toString());
      totals4num = s4j1tnum + s4j2tnum + s4j3tnum + s4j4tnum + s4j5tnum + s4j6tnum;
    });
  }

  additions5j1(dynamic) {
    setState(() {
      s5d1t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j1anum = double.parse(s5d1a.text.isNotEmpty ? s5d1a.text : "0");
      s5j1dnum = double.parse(s5d1d.text.isNotEmpty ? s5d1d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j1tnum = s5j1dnum - s5j1anum - timepause;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  additions5j2(dynamic) {
    setState(() {
      s5d2t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j2anum = double.parse(s5d2a.text.isNotEmpty ? s5d2a.text : "0");
      s5j2dnum = double.parse(s5d2d.text.isNotEmpty ? s5d2d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j2tnum = s5j2dnum - s5j2anum - timepause;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  additions5j3(dynamic) {
    setState(() {
      s5d3t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j3anum = double.parse(s5d3a.text.isNotEmpty ? s5d3a.text : "0");
      s5j3dnum = double.parse(s5d3d.text.isNotEmpty ? s5d3d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j3tnum = s5j3dnum - s5j3anum - timepause;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  additions5j4(dynamic) {
    setState(() {
      s5d4t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j4anum = double.parse(s5d4a.text.isNotEmpty ? s5d4a.text : "0");
      s5j4dnum = double.parse(s5d4d.text.isNotEmpty ? s5d4d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j4tnum = s5j4dnum - s5j4anum - timepause;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  additions5j5(dynamic) {
    setState(() {
      s5d5t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j5anum = double.parse(s5d5a.text.isNotEmpty ? s5d5a.text : "0");
      s5j5dnum = double.parse(s5d5d.text.isNotEmpty ? s5d5d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j5tnum = s5j5dnum - s5j5anum - timepause;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  additions5j6(dynamic) {
    setState(() {
      s5d6t.clear();
      totals5.clear();
      timepause = double.parse(widget.horaire.tempsPause.toString());
      s5j6anum = double.parse(s5d6a.text.isNotEmpty ? s5d6a.text : "0");
      s5j6dnum = double.parse(s5d6d.text.isNotEmpty ? s5d6d.text : "0");

      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());

      s5j6tnum = s5j6dnum - s5j6anum;
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }
  clearResults5(dynamic) {
    setState(() {
      totals5.clear();
      s5j1tnum = double.parse(s5d1t.text.isNotEmpty ? s5d1t.text : s5j1tnum.toString());
      s5j2tnum = double.parse(s5d2t.text.isNotEmpty ? s5d2t.text : s5j2tnum.toString());
      s5j3tnum = double.parse(s5d3t.text.isNotEmpty ? s5d3t.text : s5j3tnum.toString());
      s5j4tnum = double.parse(s5d4t.text.isNotEmpty ? s5d4t.text : s5j4tnum.toString());
      s5j5tnum = double.parse(s5d5t.text.isNotEmpty ? s5d5t.text : s5j5tnum.toString());
      s5j6tnum = double.parse(s5d6t.text.isNotEmpty ? s5d6t.text : s5j6tnum.toString());
      totals5num = s5j1tnum + s5j2tnum + s5j3tnum + s5j4tnum + s5j5tnum + s5j6tnum;
    });
  }


  additionTotalMois() {
    setState(() {
      totals1num = double.parse(totals1.text.isNotEmpty ? totals1.text : totals1num.toString());
      totals2num = double.parse(totals2.text.isNotEmpty ? totals2.text : totals2num.toString());
      totals3num = double.parse(totals3.text.isNotEmpty ? totals3.text : totals3num.toString());
      totals4num = double.parse(totals4.text.isNotEmpty ? totals4.text : totals4num.toString());
      totals5num = double.parse(totals5.text.isNotEmpty ? totals5.text : totals5num.toString());
      totalheureMois = totals1num + totals2num + totals3num + totals4num + totals5num;

      moyenne = double.parse(widget.horaire.contratHoraire.toString());
      totalheureMois = double.parse(totalheureMois.toString());
      moduleprecnum = double.parse(widget.horaire.module.toString());
      totalmoduleMois = totalheureMois + moduleprecnum - moyenne;

      moyenneSemaine = double.parse(moyenne.toString())/ 52 * 12;
      moyenneSemaineFormated = moyenneSemaine.roundToDouble();

      absenceS1 =  (totals1num == 0) ? 0 : moyenneSemaineFormated - totals1num;
      absenceS2 =  (totals2num == 0) ? 0 : moyenneSemaineFormated - totals2num;
      absenceS3 =  (totals3num == 0) ? 0 : moyenneSemaineFormated - totals3num;
      absenceS4 =  (totals4num == 0) ? 0 : moyenneSemaineFormated - totals4num;
      absenceS5 =  (totals5num == 0) ? 0 : moyenneSemaineFormated - totals5num;
      totalSemAbsence = ((absenceS1 < 0) ? 0 : absenceS1) + ((absenceS2 < 0) ? 0 : absenceS2) + ((absenceS3 < 0) ? 0 : absenceS3)
          + ((absenceS4 < 0) ? 0 : absenceS4) + ((absenceS5 < 0) ? 0 : absenceS5);

      heureAbsenceNum = totalSemAbsence;

      heureSupNum = totalheureMois - moyenne;

      congePayeNum = double.parse(checkS1j1) + double.parse(checkS1j2) + double.parse(checkS1j3) + double.parse(checkS1j4) + double.parse(checkS1j5) +
          double.parse(checkS2j1) + double.parse(checkS2j2) + double.parse(checkS2j3) + double.parse(checkS2j4) + double.parse(checkS2j5) +
          double.parse(checkS3j1) + double.parse(checkS3j2) + double.parse(checkS3j3) + double.parse(checkS3j4) + double.parse(checkS3j5) +
          double.parse(checkS4j1) + double.parse(checkS4j2) + double.parse(checkS4j3) + double.parse(checkS4j4) + double.parse(checkS4j5) +
          double.parse(checkS5j1) + double.parse(checkS5j2) + double.parse(checkS5j3) + double.parse(checkS5j4) + double.parse(checkS5j5);

    });
    return buildBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    final tabNewsSelect = <Widget>[
      const Tab(text: 'S1'),
      const Tab(text: 'S2'),
      const Tab(text: 'S3'),
      const Tab(text: 'S4'),
      const Tab(text: 'S5'),
    ];
    final tabNewsView = <Widget>[buildSemaine1(), buildSemaine2(), buildSemaine3(), buildSemaine4(), buildSemaine5()];
    return DefaultTabController(
        length: tabNewsSelect.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: white,
              elevation: 5,
              title: Row(
                children: [
                  Text("Modifier le mois de",
                      style: GoogleFonts.oswald(
                          textStyle: const TextStyle(
                              color: black,
                              fontSize: 18,
                              letterSpacing: 0.5,
                              height: 1,
                              decoration: TextDecoration.none))),
                  const SizedBox(width: 10),
                  Text(widget.horaire.mois.toString(),
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              letterSpacing: 0.5,
                              height: 1,
                              decoration: TextDecoration.none))),
                ],
              ),
              automaticallyImplyLeading: false,
              bottom: TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: tabNewsSelect,
                  labelColor: black),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: TabBarView(
                            children: tabNewsView,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  validateForm() {
    return ElevatedButton(
        onPressed: () {
            dbHelper!.updateData(HoraireModel(
              mois: moisController.text,
              module: moduleController.text,
              date: DateFormat('yMd').add_jm().format(DateTime.now()).toString(),
              id: widget.horaire.id,
              s1d1a: s1d1a.text,
              s1d1d: s1d1d.text,
              s1d1t: (s1d1t.text.isNotEmpty) ? s1d1t.text : s1d1t.text = s1j1tnum.toString(),
              s1d2a: s1d2a.text,
              s1d2d: s1d2d.text,
              s1d2t: (s1d2t.text.isNotEmpty) ? s1d2t.text : s1d2t.text = s1j2tnum.toString(),
              s1d3a: s1d3a.text,
              s1d3d: s1d3d.text,
              s1d3t: (s1d3t.text.isNotEmpty) ? s1d3t.text : s1d3t.text = s1j3tnum.toString(),
              s1d4a: s1d4a.text,
              s1d4d: s1d4d.text,
              s1d4t: (s1d4t.text.isNotEmpty) ? s1d4t.text : s1d4t.text = s1j4tnum.toString(),
              s1d5a: s1d5a.text,
              s1d5d: s1d5d.text,
              s1d5t: (s1d5t.text.isNotEmpty) ? s1d5t.text : s1d5t.text = s1j5tnum.toString(),
              s1d6a: s1d6a.text,
              s1d6d: s1d6d.text,
              s1d6t: (s1d6t.text.isNotEmpty) ? s1d6t.text : s1d6t.text = s1j6tnum.toString(),
              totals1: (totals1.text.isNotEmpty) ? totals1.text : totals1.text = totals1num.toString(),
              s2d1a: s2d1a.text,
              s2d1d: s2d1d.text,
              s2d1t: (s2d1t.text.isNotEmpty) ? s2d1t.text : s2d1t.text = s2j1tnum.toString(),
              s2d2a: s2d2a.text,
              s2d2d: s2d2d.text,
              s2d2t: (s2d2t.text.isNotEmpty) ? s2d2t.text : s2d2t.text = s2j2tnum.toString(),
              s2d3a: s2d3a.text,
              s2d3d: s2d3d.text,
              s2d3t: (s2d3t.text.isNotEmpty) ? s2d3t.text : s2d3t.text = s2j3tnum.toString(),
              s2d4a: s2d4a.text,
              s2d4d: s2d4d.text,
              s2d4t: (s2d4t.text.isNotEmpty) ? s2d4t.text : s2d4t.text = s2j4tnum.toString(),
              s2d5a: s2d5a.text,
              s2d5d: s2d5d.text,
              s2d5t: (s2d5t.text.isNotEmpty) ? s2d5t.text : s2d5t.text = s2j5tnum.toString(),
              s2d6a: s2d6a.text,
              s2d6d: s2d6d.text,
              s2d6t: (s2d6t.text.isNotEmpty) ? s2d6t.text : s2d6t.text = s2j6tnum.toString(),
              totals2: (totals2.text.isNotEmpty) ? totals2.text : totals2.text = totals2num.toString(),
              s3d1a: s3d1a.text,
              s3d1d: s3d1d.text,
              s3d1t: (s3d1t.text.isNotEmpty) ? s3d1t.text : s3d1t.text = s3j1tnum.toString(),
              s3d2a: s3d2a.text,
              s3d2d: s3d2d.text,
              s3d2t: (s3d2t.text.isNotEmpty) ? s3d2t.text : s3d2t.text = s3j2tnum.toString(),
              s3d3a: s3d3a.text,
              s3d3d: s3d3d.text,
              s3d3t: (s3d3t.text.isNotEmpty) ? s3d3t.text : s3d3t.text = s3j3tnum.toString(),
              s3d4a: s3d4a.text,
              s3d4d: s3d4d.text,
              s3d4t: (s3d4t.text.isNotEmpty) ? s3d4t.text : s3d4t.text = s3j4tnum.toString(),
              s3d5a: s3d5a.text,
              s3d5d: s3d5d.text,
              s3d5t: (s3d5t.text.isNotEmpty) ? s3d5t.text : s3d5t.text = s3j5tnum.toString(),
              s3d6a: s3d6a.text,
              s3d6d: s3d6d.text,
              s3d6t: (s3d6t.text.isNotEmpty) ? s3d6t.text : s3d6t.text = s3j6tnum.toString(),
              totals3: (totals3.text.isNotEmpty) ? totals3.text : totals3.text = totals3num.toString(),
              s4d1a: s4d1a.text,
              s4d1d: s4d1d.text,
              s4d1t: (s4d1t.text.isNotEmpty) ? s4d1t.text : s4d1t.text = s4j1tnum.toString(),
              s4d2a: s4d2a.text,
              s4d2d: s4d2d.text,
              s4d2t: (s4d2t.text.isNotEmpty) ? s4d2t.text : s4d2t.text = s4j2tnum.toString(),
              s4d3a: s4d3a.text,
              s4d3d: s4d3d.text,
              s4d3t: (s4d3t.text.isNotEmpty) ? s4d3t.text : s4d3t.text = s4j3tnum.toString(),
              s4d4a: s4d4a.text,
              s4d4d: s4d4d.text,
              s4d4t: (s4d4t.text.isNotEmpty) ? s4d4t.text : s4d4t.text = s4j4tnum.toString(),
              s4d5a: s4d5a.text,
              s4d5d: s4d5d.text,
              s4d5t: (s4d5t.text.isNotEmpty) ? s4d5t.text : s4d5t.text = s4j5tnum.toString(),
              s4d6a: s4d6a.text,
              s4d6d: s4d6d.text,
              s4d6t: (s4d6t.text.isNotEmpty) ? s4d6t.text : s4d6t.text = s4j6tnum.toString(),
              totals4: (totals4.text.isNotEmpty) ? totals4.text : totals4.text = totals4num.toString(),
              s5d1a: s5d1a.text,
              s5d1d: s5d1d.text,
              s5d1t: (s5d1t.text.isNotEmpty) ? s5d1t.text : s5d1t.text = s5j1tnum.toString(),
              s5d2a: s5d2a.text,
              s5d2d: s5d2d.text,
              s5d2t: (s5d2t.text.isNotEmpty) ? s5d2t.text : s5d2t.text = s5j2tnum.toString(),
              s5d3a: s5d3a.text,
              s5d3d: s5d3d.text,
              s5d3t: (s5d3t.text.isNotEmpty) ? s5d3t.text : s5d3t.text = s5j3tnum.toString(),
              s5d4a: s5d4a.text,
              s5d4d: s5d4d.text,
              s5d4t: (s5d4t.text.isNotEmpty) ? s5d4t.text : s5d4t.text = s5j4tnum.toString(),
              s5d5a: s5d5a.text,
              s5d5d: s5d5d.text,
              s5d5t: (s5d5t.text.isNotEmpty) ? s5d5t.text : s5d5t.text = s5j5tnum.toString(),
              s5d6a: s5d6a.text,
              s5d6d: s5d6d.text,
              s5d6t: (s5d6t.text.isNotEmpty) ? s5d6t.text : s5d6t.text = s5j6tnum.toString(),
              totals5: (totals5.text.isNotEmpty) ? totals5.text : totals5.text = totals5num.toString(),
              notifs1: notifs1.text,
              notifs2: notifs2.text,
              notifs3: notifs3.text,
              notifs4: notifs4.text,
              notifs5: notifs5.text,
              totalHeureDuMois: totalHeureDuMois.text = totalheureMois.toString(),
              totalModuleDuMois: totalModuleDuMois.text = totalmoduleMois.toString(),
              contratHoraire: contratHoraire.text,
              tempsPause: tempsPause.text,
              absence: heureAbsenceNum.toString(),
              heureSup: heureSupNum.toString(),
              congePaye: congePayeNum.toString(),
              cpS1j1: checkS1j1,
              cpS1j2: checkS1j2,
              cpS1j3: checkS1j3,
              cpS1j4: checkS1j4,
              cpS1j5: checkS1j5,

              cpS2j1: checkS2j1,
              cpS2j2: checkS2j2,
              cpS2j3: checkS2j3,
              cpS2j4: checkS2j4,
              cpS2j5: checkS2j5,

              cpS3j1: checkS3j1,
              cpS3j2: checkS3j2,
              cpS3j3: checkS3j3,
              cpS3j4: checkS3j4,
              cpS3j5: checkS3j5,

              cpS4j1: checkS4j1,
              cpS4j2: checkS4j2,
              cpS4j3: checkS4j3,
              cpS4j4: checkS4j4,
              cpS4j5: checkS4j5,

              cpS5j1: checkS5j1,
              cpS5j2: checkS5j2,
              cpS5j3: checkS5j3,
              cpS5j4: checkS5j4,
              cpS5j5: checkS5j5,
            ));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));

        },
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
        child: Text("Enregistrer les modifications",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: white,
                    fontSize: 13,
                    decoration: TextDecoration.none))));
  }
  buildBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return FadeAnimation(
            delay: 100,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Row(
                        children: [
                          Text("Modulation du mois précédent : ",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: black,
                                      fontSize: 15,
                                      decoration: TextDecoration.none))),
                          const SizedBox(width: 10),
                          (widget.horaire.module.toString().contains('-'))
                              ? Text(widget.horaire.module.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: red,
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none)))
                              : Text(widget.horaire.module.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("Heures total du mois : ",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: black,
                                      fontSize: 15,
                                      decoration: TextDecoration.none))),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 60,
                              child: Text(totalheureMois.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 15,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis)))),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text("Modulation a la fin du mois : ",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: black,
                                      fontSize: 15,
                                      decoration: TextDecoration.none))),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 60,
                              child: (totalmoduleMois.toString().contains('-'))
                                  ? Text(totalmoduleMois.toString(),
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: red,
                                              fontSize: 15,
                                              letterSpacing: 1,
                                              decoration: TextDecoration.none,
                                              overflow: TextOverflow.ellipsis)))
                                  : Text(totalmoduleMois.toString(),
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 15,
                                              letterSpacing: 1,
                                              decoration: TextDecoration.none,
                                              overflow:
                                                  TextOverflow.ellipsis)))),
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: validateForm()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: grey),
                        child: Text(
                          "Revenir a l'accueil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: white,
                                  fontSize: 13,
                                  decoration: TextDecoration.none)),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: white),
                        child: Text(
                          "Fermer",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: black,
                                  fontSize: 13,
                                  decoration: TextDecoration.none)),
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }


  Widget buildSemaine1() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FadeAnimation(
            delay: 50,
            child: CustomTextField(
              jour: 'Lundi :',
              controllerArr: s1d1a,
              controllerDep: s1d1d,
              controllerTot: s1d1t,
              functionArr: additions1j1,
              functionDep: additions1j1,
              functionTot: clearResults1,
              labelTextResult: (s1d1t.text.isNotEmpty || s1j1tnum.toString().isEmpty) ? "" : s1j1tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 100,
            child: CustomTextField(
              jour: 'Mardi :',
              controllerArr: s1d2a,
              controllerDep: s1d2d,
              controllerTot: s1d2t,
              functionArr: additions1j2,
              functionDep: additions1j2,
              functionTot: clearResults1,
              labelTextResult: (s1d2t.text.isNotEmpty || s1j2tnum.toString().isEmpty) ? "" : s1j2tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 150,
            child: CustomTextField(
              jour: 'Mercredi :',
              controllerArr: s1d3a,
              controllerDep: s1d3d,
              controllerTot: s1d3t,
              functionArr: additions1j3,
              functionDep: additions1j3,
              functionTot: clearResults1,
              labelTextResult: (s1d3t.text.isNotEmpty || s1j3tnum.toString().isEmpty) ? "" : s1j3tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 200,
            child: CustomTextField(
              jour: 'Jeudi :',
              controllerArr: s1d4a,
              controllerDep: s1d4d,
              controllerTot: s1d4t,
              functionArr: additions1j4,
              functionDep: additions1j4,
              functionTot: clearResults1,
              labelTextResult: (s1d4t.text.isNotEmpty || s1j4tnum.toString().isEmpty) ? "" : s1j4tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 250,
            child: CustomTextField(
              jour: 'Vendredi :',
              controllerArr: s1d5a,
              controllerDep: s1d5d,
              controllerTot: s1d5t,
              functionArr: additions1j5,
              functionDep: additions1j5,
              functionTot: clearResults1,
              labelTextResult: (s1d5t.text.isNotEmpty || s1j5tnum.toString().isEmpty) ? "" : s1j5tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 300,
            child: CustomTextField(
              jour: 'Samedi :',
              controllerArr: s1d6a,
              controllerDep: s1d6d,
              controllerTot: s1d6t,
              functionArr: additions1j6,
              functionDep: additions1j6,
              functionTot: clearResults1,
              labelTextResult: (s1d6t.text.isNotEmpty || s1j6tnum.toString().isEmpty) ? "" : s1j6tnum.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 300,
            child: Row(
              children: [
                Text( "Congés Payés :    ", style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none))),
                Row(children: [
                    Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    value: isSelectedS1j1,
                    onChanged: (e) {
                      setState(() {
                        isSelectedS1j1 = e!;
                        checkS1j1 = isSelectedS1j1 == true ? "1" : "0";
                        moyenneCPCalcul();
                        s1d1t.text = checkS1j1 == "1" ? moyenneCP : "0";
                        clearResults1(dynamic);
                      });
                    }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS1j2,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS1j2 = e!;
                          checkS1j2 = isSelectedS1j2 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s1d2t.text = checkS1j2 == "1" ? moyenneCP : "0";
                          clearResults1(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS1j3,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS1j3 = e!;
                          checkS1j3 = isSelectedS1j3 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s1d3t.text = checkS1j3 == "1" ? moyenneCP : "0";
                          clearResults1(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS1j4,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS1j4 = e!;
                          checkS1j4 = isSelectedS1j4 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s1d4t.text = checkS1j4 == "1" ? moyenneCP : "0";
                          clearResults1(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS1j5,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS1j5 = e!;
                          checkS1j5 = isSelectedS1j5 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s1d5t.text = checkS1j5 == "1" ? moyenneCP : "0";
                          clearResults1(dynamic);
                        });
                      }),
                ],),
              ],
            ),
            ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 350,
            child: CustomTextFieldFooter(
              functionTotal: additionTotalMois,
              titre: "Total Semaine :",
              controllerTot: totals1,
              controllerNotif: notifs1,
              labelTextResult: (totals1.text.isNotEmpty || totals1num.toString().isEmpty) ? "" : totals1num.toString(),
              // functionTotal: additionTotals1,
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 400,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey),
                  child: Text(
                    "Revenir a la page d'accueil",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: white,
                            fontSize: 13,
                            decoration: TextDecoration.none)),
                  )),
            ),
          )
        ]),
      ),
    );
  }
  Widget buildSemaine2() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FadeAnimation(
            delay: 50,
            child: CustomTextField(
              jour: 'Lundi :',
              controllerArr: s2d1a,
              controllerDep: s2d1d,
              controllerTot: s2d1t,
              functionArr: additions2j1,
              functionDep: additions2j1,
              functionTot: clearResults2,
              labelTextResult:
                  (s2d1t.text.isNotEmpty || s2j1tnum.toString().isEmpty)
                      ? ""
                      : s2j1tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 100,
            child: CustomTextField(
              jour: 'Mardi :',
              controllerArr: s2d2a,
              controllerDep: s2d2d,
              controllerTot: s2d2t,
              functionArr: additions2j2,
              functionDep: additions2j2,
              functionTot: clearResults2,
              labelTextResult: (s2d2t.text.isNotEmpty || s2j2tnum.toString().isEmpty) ? "" : s2j2tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 150,
            child: CustomTextField(
              jour: 'Mercredi :',
              controllerArr: s2d3a,
              controllerDep: s2d3d,
              controllerTot: s2d3t,
              functionArr: additions2j3,
              functionDep: additions2j3,
              functionTot: clearResults2,
              labelTextResult:
                  (s2d3t.text.isNotEmpty || s2j3tnum.toString().isEmpty)
                      ? ""
                      : s2j3tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 200,
            child: CustomTextField(
              jour: 'Jeudi :',
              controllerArr: s2d4a,
              controllerDep: s2d4d,
              controllerTot: s2d4t,
              functionArr: additions2j4,
              functionDep: additions2j4,
              functionTot: clearResults2,
              labelTextResult:
                  (s2d4t.text.isNotEmpty || s2j4tnum.toString().isEmpty)
                      ? ""
                      : s2j4tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 250,
            child: CustomTextField(
              jour: 'Vendredi :',
              controllerArr: s2d5a,
              controllerDep: s2d5d,
              controllerTot: s2d5t,
              functionArr: additions2j5,
              functionDep: additions2j5,
              functionTot: clearResults2,
              labelTextResult: (s2d5t.text.isNotEmpty || s2j5tnum.toString().isEmpty) ? "" : s2j5tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 300,
            child: CustomTextField(
              jour: 'Samedi :',
              controllerArr: s2d6a,
              controllerDep: s2d6d,
              controllerTot: s2d6t,
              functionArr: additions2j6,
              functionDep: additions2j6,
              functionTot: clearResults2,
              labelTextResult: (s2d6t.text.isNotEmpty || s2j6tnum.toString().isEmpty) ? "" : s2j6tnum.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 300,
            child: Row(
              children: [
                Text( "Congés Payés :    ", style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none))),
                Row(children: [
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS2j1,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS2j1 = e!;
                          checkS2j1 = isSelectedS2j1 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s2d1t.text = checkS2j1 == "1" ? moyenneCP : "0";
                          clearResults2(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS2j2,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS2j2 = e!;
                          checkS2j2 = isSelectedS2j2 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s2d2t.text = checkS2j2 == "1" ? moyenneCP : "0";
                          clearResults2(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS2j3,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS2j3 = e!;
                          checkS2j3 = isSelectedS2j3 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s2d3t.text = checkS2j3 == "1" ? moyenneCP : "0";
                          clearResults2(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS2j4,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS2j4 = e!;
                          checkS2j4 = isSelectedS2j4 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s2d4t.text = checkS2j4 == "1" ? moyenneCP : "0";
                          clearResults2(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS2j5,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS2j5 = e!;
                          checkS2j5 = isSelectedS2j5 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s2d5t.text = checkS2j5 == "1" ? moyenneCP : "0";
                          clearResults2(dynamic);
                        });
                      }),
                ],),
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 350,
            child: CustomTextFieldFooter(
              functionTotal: additionTotalMois,
              titre: "Total Semaine :",
              controllerTot: totals2,
              controllerNotif: notifs2,
              labelTextResult: (totals2.text.isNotEmpty || totals2num.toString().isEmpty) ? "" : totals2num.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 400,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey),
                  child: Text(
                    "Revenir a la page d'accueil",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: white,
                            fontSize: 13,
                            decoration: TextDecoration.none)),
                  )),
            ),
          )
        ]),
      ),
    );
  }
  Widget buildSemaine3() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FadeAnimation(
            delay: 50,
            child: CustomTextField(
              jour: 'Lundi :',
              controllerArr: s3d1a,
              controllerDep: s3d1d,
              controllerTot: s3d1t,
              functionArr: additions3j1,
              functionDep: additions3j1,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d1t.text.isNotEmpty || s3j1tnum.toString().isEmpty)
                      ? ""
                      : s3j1tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 100,
            child: CustomTextField(
              jour: 'Mardi :',
              controllerArr: s3d2a,
              controllerDep: s3d2d,
              controllerTot: s3d2t,
              functionArr: additions3j2,
              functionDep: additions3j2,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d2t.text.isNotEmpty || s3j2tnum.toString().isEmpty)
                      ? ""
                      : s3j2tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 150,
            child: CustomTextField(
              jour: 'Mercredi :',
              controllerArr: s3d3a,
              controllerDep: s3d3d,
              controllerTot: s3d3t,
              functionArr: additions3j3,
              functionDep: additions3j3,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d3t.text.isNotEmpty || s3j3tnum.toString().isEmpty)
                      ? ""
                      : s3j3tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 200,
            child: CustomTextField(
              jour: 'Jeudi :',
              controllerArr: s3d4a,
              controllerDep: s3d4d,
              controllerTot: s3d4t,
              functionArr: additions3j4,
              functionDep: additions3j4,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d4t.text.isNotEmpty || s3j4tnum.toString().isEmpty)
                      ? ""
                      : s3j4tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 250,
            child: CustomTextField(
              jour: 'Vendredi :',
              controllerArr: s3d5a,
              controllerDep: s3d5d,
              controllerTot: s3d5t,
              functionArr: additions3j5,
              functionDep: additions3j5,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d5t.text.isNotEmpty || s3j5tnum.toString().isEmpty)
                      ? ""
                      : s3j5tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 300,
            child: CustomTextField(
              jour: 'Samedi :',
              controllerArr: s3d6a,
              controllerDep: s3d6d,
              controllerTot: s3d6t,
              functionArr: additions3j6,
              functionDep: additions3j6,
              functionTot: clearResults3,
              labelTextResult:
                  (s3d6t.text.isNotEmpty || s3j6tnum.toString().isEmpty)
                      ? ""
                      : s3j6tnum.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 300,
            child: Row(
              children: [
                Text( "Congés Payés :    ", style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none))),
                Row(children: [
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS3j1,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS3j1 = e!;
                          checkS3j1 = isSelectedS3j1 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s3d1t.text = checkS3j1 == "1" ? moyenneCP : "0";
                          clearResults3(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS3j2,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS3j2 = e!;
                          checkS3j2 = isSelectedS3j2 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s3d2t.text = checkS3j2 == "1" ? moyenneCP : "0";
                          clearResults3(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS3j3,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS3j3 = e!;
                          checkS3j3 = isSelectedS3j3 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s3d3t.text = checkS3j3 == "1" ? moyenneCP : "0";
                          clearResults3(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS3j4,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS3j4 = e!;
                          checkS3j4 = isSelectedS3j4 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s3d4t.text = checkS3j4 == "1" ? moyenneCP : "0";
                          clearResults3(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS3j5,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS3j5 = e!;
                          checkS3j5 = isSelectedS3j5 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s3d5t.text = checkS3j5 == "1" ? moyenneCP : "0";
                          clearResults3(dynamic);
                        });
                      }),
                ],),
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 350,
            child: CustomTextFieldFooter(
              functionTotal: additionTotalMois,
              titre: "Total Semaine :",
              controllerTot: totals3,
              controllerNotif: notifs3,
              labelTextResult:
                  (totals3.text.isNotEmpty || totals3num.toString().isEmpty)
                      ? ""
                      : totals3num.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 400,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey),
                  child: Text(
                    "Revenir a la page d'accueil",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: white,
                            fontSize: 13,
                            decoration: TextDecoration.none)),
                  )),
            ),
          )
        ]),
      ),
    );
  }
  Widget buildSemaine4() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FadeAnimation(
            delay: 50,
            child: CustomTextField(
              jour: 'Lundi :',
              controllerArr: s4d1a,
              controllerDep: s4d1d,
              controllerTot: s4d1t,
              functionArr: additions4j1,
              functionDep: additions4j1,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d1t.text.isNotEmpty || s4j1tnum.toString().isEmpty)
                      ? ""
                      : s4j1tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 100,
            child: CustomTextField(
              jour: 'Mardi :',
              controllerArr: s4d2a,
              controllerDep: s4d2d,
              controllerTot: s4d2t,
              functionArr: additions4j2,
              functionDep: additions4j2,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d2t.text.isNotEmpty || s4j2tnum.toString().isEmpty)
                      ? ""
                      : s4j2tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 150,
            child: CustomTextField(
              jour: 'Mercredi :',
              controllerArr: s4d3a,
              controllerDep: s4d3d,
              controllerTot: s4d3t,
              functionArr: additions4j3,
              functionDep: additions4j3,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d3t.text.isNotEmpty || s4j3tnum.toString().isEmpty)
                      ? ""
                      : s4j3tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 200,
            child: CustomTextField(
              jour: 'Jeudi :',
              controllerArr: s4d4a,
              controllerDep: s4d4d,
              controllerTot: s4d4t,
              functionArr: additions4j4,
              functionDep: additions4j4,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d4t.text.isNotEmpty || s4j4tnum.toString().isEmpty)
                      ? ""
                      : s4j4tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 250,
            child: CustomTextField(
              jour: 'Vendredi :',
              controllerArr: s4d5a,
              controllerDep: s4d5d,
              controllerTot: s4d5t,
              functionArr: additions4j5,
              functionDep: additions4j5,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d5t.text.isNotEmpty || s4j5tnum.toString().isEmpty)
                      ? ""
                      : s4j5tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 300,
            child: CustomTextField(
              jour: 'Samedi :',
              controllerArr: s4d6a,
              controllerDep: s4d6d,
              controllerTot: s4d6t,
              functionArr: additions4j6,
              functionDep: additions4j6,
              functionTot: clearResults4,
              labelTextResult:
                  (s4d6t.text.isNotEmpty || s4j6tnum.toString().isEmpty)
                      ? ""
                      : s4j6tnum.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 300,
            child: Row(
              children: [
                Text( "Congés Payés :    ", style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none))),
                Row(children: [
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS4j1,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS4j1 = e!;
                          checkS4j1 = isSelectedS4j1 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s4d1t.text = checkS4j1 == "1" ? moyenneCP : "0";
                          clearResults4(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS4j2,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS4j2 = e!;
                          checkS4j2 = isSelectedS4j2 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s4d2t.text = checkS4j2 == "1" ? moyenneCP : "0";
                          clearResults4(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS4j3,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS4j3 = e!;
                          checkS4j3 = isSelectedS4j3 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s4d3t.text = checkS4j3 == "1" ? moyenneCP : "0";
                          clearResults4(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS4j4,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS4j4 = e!;
                          checkS4j4 = isSelectedS4j4 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s4d4t.text = checkS4j4 == "1" ? moyenneCP : "0";
                          clearResults4(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS4j5,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS4j5 = e!;
                          checkS4j5 = isSelectedS4j5 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s4d5t.text = checkS4j5 == "1" ? moyenneCP : "0";
                          clearResults4(dynamic);
                        });
                      }),
                ],),
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 350,
            child: CustomTextFieldFooter(
              functionTotal: additionTotalMois,
              titre: "Total Semaine :",
              controllerTot: totals4,
              controllerNotif: notifs4,
              labelTextResult:
                  (totals4.text.isNotEmpty || totals4num.toString().isEmpty)
                      ? ""
                      : totals4num.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 400,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey),
                  child: Text(
                    "Revenir a la page d'accueil",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: white,
                            fontSize: 13,
                            decoration: TextDecoration.none)),
                  )),
            ),
          )
        ]),
      ),
    );
  }
  Widget buildSemaine5() {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FadeAnimation(
            delay: 50,
            child: CustomTextField(
              jour: 'Lundi :',
              controllerArr: s5d1a,
              controllerDep: s5d1d,
              controllerTot: s5d1t,
              functionArr: additions5j1,
              functionDep: additions5j1,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d1t.text.isNotEmpty || s5j1tnum.toString().isEmpty)
                      ? ""
                      : s5j1tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 100,
            child: CustomTextField(
              jour: 'Mardi :',
              controllerArr: s5d2a,
              controllerDep: s5d2d,
              controllerTot: s5d2t,
              functionArr: additions5j2,
              functionDep: additions5j2,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d2t.text.isNotEmpty || s5j2tnum.toString().isEmpty)
                      ? ""
                      : s5j2tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 150,
            child: CustomTextField(
              jour: 'Mercredi :',
              controllerArr: s5d3a,
              controllerDep: s5d3d,
              controllerTot: s5d3t,
              functionArr: additions5j3,
              functionDep: additions5j3,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d3t.text.isNotEmpty || s5j3tnum.toString().isEmpty)
                      ? ""
                      : s5j3tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 200,
            child: CustomTextField(
              jour: 'Jeudi :',
              controllerArr: s5d4a,
              controllerDep: s5d4d,
              controllerTot: s5d4t,
              functionArr: additions5j4,
              functionDep: additions5j4,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d4t.text.isNotEmpty || s5j4tnum.toString().isEmpty)
                      ? ""
                      : s5j4tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 250,
            child: CustomTextField(
              jour: 'Vendredi :',
              controllerArr: s5d5a,
              controllerDep: s5d5d,
              controllerTot: s5d5t,
              functionArr: additions5j5,
              functionDep: additions5j5,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d5t.text.isNotEmpty || s5j5tnum.toString().isEmpty)
                      ? ""
                      : s5j5tnum.toString(),
            ),
          ),
          const SizedBox(height: 10),
          FadeAnimation(
            delay: 300,
            child: CustomTextField(
              jour: 'Samedi :',
              controllerArr: s5d6a,
              controllerDep: s5d6d,
              controllerTot: s5d6t,
              functionArr: additions5j6,
              functionDep: additions5j6,
              functionTot: clearResults5,
              labelTextResult:
                  (s5d6t.text.isNotEmpty || s5j6tnum.toString().isEmpty)
                      ? ""
                      : s5j6tnum.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 300,
            child: Row(
              children: [
                Text( "Congés Payés :    ", style: GoogleFonts.oswald(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16,decoration: TextDecoration.none))),
                Row(children: [
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS5j1,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS5j1 = e!;
                          checkS5j1 = isSelectedS5j1 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s5d1t.text = checkS5j1 == "1" ? moyenneCP : "0";
                          clearResults5(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS5j2,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS5j2 = e!;
                          checkS5j2 = isSelectedS5j2 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s5d2t.text = checkS5j2 == "1" ? moyenneCP : "0";
                          clearResults5(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS5j3,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS5j3 = e!;
                          checkS5j3 = isSelectedS5j3 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s5d3t.text = checkS5j3 == "1" ? moyenneCP : "0";
                          clearResults5(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS5j4,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS5j4 = e!;
                          checkS5j4 = isSelectedS5j4 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s5d4t.text = checkS5j4 == "1" ? moyenneCP : "0";
                          clearResults5(dynamic);
                        });
                      }),
                  Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: isSelectedS5j5,
                      onChanged: (e) {
                        setState(() {
                          isSelectedS5j5 = e!;
                          checkS5j5 = isSelectedS5j5 == true ? "1" : "0";
                          moyenneCPCalcul();
                          s5d5t.text = checkS5j5 == "1" ? moyenneCP : "0";
                          clearResults5(dynamic);
                        });
                      }),
                ],),
              ],
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 350,
            child: CustomTextFieldFooter(
              functionTotal: additionTotalMois,
              titre: "Total Semaine :",
              controllerTot: totals5,
              controllerNotif: notifs5,
              labelTextResult:
                  (totals5.text.isNotEmpty || totals5num.toString().isEmpty)
                      ? ""
                      : totals5num.toString(),
            ),
          ),
          const SizedBox(height: 30),
          FadeAnimation(
            delay: 400,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: grey),
                  child: Text(
                    "Revenir a la page d'accueil",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: white,
                            fontSize: 13,
                            decoration: TextDecoration.none)),
                  )),
            ),
          )
        ]),
      ),
    );
  }

}
