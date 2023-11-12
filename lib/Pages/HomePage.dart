import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horaire/Animation/FadeAnimation.dart';
import 'package:horaire/Models/UserModel.dart';
import 'package:horaire/Pages/UserPage.dart';
import 'package:horaire/Services/Notification.dart';
import 'package:horaire/Theme/colors.dart';
import 'package:ionicons/ionicons.dart';
import '../Models/HoraireModel.dart';
import '../Services/DatabaseHoraire.dart';
import '../Services/DatabaseUser.dart';
import 'AddPage.dart';
import 'EditPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NotificationService notificationService = NotificationService();

  DBHelperUser? dbHelperUser;
  DBHelperHoraire? dbHelperHoraire;
  late Future<List<UserModel>> dataUserList;
  late Future<List<HoraireModel>> dataList;

  final TextEditingController searchController = TextEditingController();
  bool isExecute = false;
  String? snap;


  @override
  void initState() {
    super.initState();
    dbHelperUser = DBHelperUser();
    dbHelperHoraire = DBHelperHoraire();
    notificationService = NotificationService();
    loadData();
  }
  
  loadData() async {
    dataUserList = dbHelperUser!.getDataListUser();
    dataList = dbHelperHoraire!.getDataList();
    notificationService.sendNotification();
  }

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
          FutureBuilder(
            future: dataUserList,
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return IconButton(
                      onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserPage(isUpdate: false,pause:null,contrat: null)));
                    },
                    icon: const Icon(Icons.settings, color: grey, size: 20));
              }
              else {
                return SizedBox(
                  height: 40,
                  width: 40,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var value = snapshot.data![index];
                        return IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(isUpdate: true,pause: value.pause,contrat: value.contrat)));
                            },
                            icon: const Icon(Icons.settings, color: grey, size: 20));
                      }

                  ),
                );
              }
            },

          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 90,
            // color: grey.withOpacity(0.6),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -110,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 0.5)),
                        fillColor: Colors.grey.withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,size: 20),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                searchController.clear();
                                isExecute = false;
                              });
                            },
                            child: (searchController.text.isNotEmpty) ? const Icon(Icons.close,color: grey,size: 18) : const SizedBox()
                        ),
                      ),
                      style: GoogleFonts.poppins( textStyle: const TextStyle(color: black,fontSize: 13,decoration: TextDecoration.none)),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      cursorColor: Theme.of(context).primaryColor,
                      controller: searchController,
                      onChanged: (value) {
                        snap = value;
                        setState(() {
                          (searchController.text.isNotEmpty) ? isExecute = true : isExecute = false;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    // color: grey.withOpacity(0.6),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: FutureBuilder(
                          future: dataUserList,
                          builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                            if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                              return GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Paramètres utilisateur requis ...",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  decoration: TextDecoration.none))),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  Timer(const Duration(milliseconds: 150), () {
                                    setState(() {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserPage(isUpdate: false, pause: null, contrat: null)));
                                    });
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                    color:  Theme.of(context).primaryColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: const Offset(2, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child:
                                  const Icon(Ionicons.add, color: white, size: 20),
                                ),
                              );
                            }
                            else {
                              return SizedBox(
                                width: 50,
                                height: 50,
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var value = snapshot.data![index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPage(valuePause: value.pause,valueContrat: value.contrat)));
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(4)),
                                            color: Theme.of(context).primaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                blurRadius: 4,
                                                offset: const Offset(2, 2), // Shadow position
                                              ),
                                            ],
                                          ),
                                          child:
                                          const Icon(Ionicons.add, color: white, size: 20),
                                        ),
                                      );
                                    }
                                ),
                              );
                            }
                          },

                        )
                    ),
                  ),
                ],)
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: const Divider(height: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
                height: MediaQuery.of(context).size.height - 180,
                child: isExecute ? FutureBuilder(
                  future: dataList,
                  builder: (context,AsyncSnapshot<List<HoraireModel>> snapshot) {
                    if (!snapshot.hasData || snapshot.data == null){
                      return Center(child:  SpinKitRipple(color: Theme.of(context).primaryColor, size: 100.0),);
                    }
                    else if (snapshot.data!.isEmpty) {
                      return Center(
                          child: Text("Pas de données",style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 1,decoration: TextDecoration.none))));
                    }
                    else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                          if (snapshot.data![index].mois!.contains(snap!)) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => (EditPage(horaire: data))));
                                },
                                onLongPress: () async {
                                  openDialog(context, snapshot, index);
                                },
                                child: buildCard(context, snapshot, index));
                          } else {return Container();}
                        },
                      );
                    }
                  },
                ) : FutureBuilder(
                  future: dataList,
                  builder: (context,AsyncSnapshot<List<HoraireModel>> snapshot) {
                    if (!snapshot.hasData || snapshot.data == null){
                      return Center(child:  SpinKitRipple(color: Theme.of(context).primaryColor, size: 100.0),);
                    }
                    else if (snapshot.data!.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("Pas de donnés disponible",style: GoogleFonts.poppins(textStyle: const TextStyle(color: black,fontSize: 14,height: 1,decoration: TextDecoration.none)))),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                                onPressed: () async {
                                  await dbHelperHoraire?.restoreDb();
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Récuperation de la base de données reussi ...",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    decoration: TextDecoration.none))),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                  });
                                },
                                style:
                                ElevatedButton.styleFrom(backgroundColor: grey),
                                child: Text(
                                  'Récuperer une base de données',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: white,
                                          fontSize: 13,
                                          decoration: TextDecoration.none)),
                                )),
                          ),
                        ],
                      );

                    }
                    else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => (EditPage(horaire: data))));
                              },
                              onLongPress: () async {
                                openDialog(context, snapshot, index);
                              },
                              child: buildCard(context, snapshot, index));
                        },
                      );
                    }
                  },
                )
            ),
          ),
        ],
      )),
    );
  }

  Widget buildCard(context, snapshot, int index) {
    var data = snapshot.data![index];
    return FadeAnimation(
      delay: 300,
      isHorizontal: true,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.all(10),
          color: white,
          shadowColor: Colors.black,
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                    width: 5,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // titre
                            Text(data.mois, style: GoogleFonts.oswald(textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 20,
                                        letterSpacing: 0.5,
                                        height: 1.3,
                                        decoration: TextDecoration.none))),
                            (data.congePaye.isEmpty || data.congePaye.contains('0.0')) ? Container() : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                Text("Congés Payés :", style: GoogleFonts.poppins(textStyle: const TextStyle(color: black, fontSize: 14, height: 1.5, decoration: TextDecoration.none))),
                                const SizedBox(width: 5),
                                SizedBox(width: 35,child: Text(data.congePaye,style: GoogleFonts.poppins(textStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, height: 1.5, letterSpacing: 1, decoration: TextDecoration.none, overflow: TextOverflow.ellipsis))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Ionicons.timer,
                                color: Theme.of(context).primaryColor, size: 20),
                            const SizedBox(width: 10),
                            Text("Heures total effectué :",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        height: 2,
                                        decoration: TextDecoration.none))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 60,
                              child: Text(data.totalHeureDuMois,
                                  style: GoogleFonts.poppins(
                                      textStyle:  TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          height: 1.8,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Icon(Ionicons.warning,
                                color: Theme.of(context).primaryColor, size: 20),
                            const SizedBox(width: 10),
                            Text("Heures d'absence :",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        height: 2,
                                        decoration: TextDecoration.none))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 60,
                              child: (data.absence.contains('-'))
                                ? Text("0", style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                      height: 1.8,
                                      letterSpacing: 1,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis)))
                                  : Text(data.absence, style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: red,
                                      fontSize: 14,
                                      height: 1.8,
                                      letterSpacing: 1,
                                      decoration: TextDecoration.none,
                                      overflow: TextOverflow.ellipsis))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Ionicons.duplicate_outline,
                                color: Theme.of(context).primaryColor,size: 20),
                            const SizedBox(width: 10),
                            Text("Heures supplémentaires :",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        height: 2,
                                        decoration: TextDecoration.none))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 60,
                              child: Text((data.heureSup.contains('-'))
                                  ? "0" : data.heureSup,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          height: 1.8,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Ionicons.stats_chart_outline,
                                color: Theme.of(context).primaryColor,size: 18),
                            const SizedBox(width: 10),
                            Text("Modulation de fin de mois :",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        height: 2,
                                        decoration: TextDecoration.none))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 60,
                              child: (data.totalModuleDuMois.contains('-'))
                                  ? Text(data.totalModuleDuMois,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: red,
                                          fontSize: 14,
                                          height: 1.8,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none,
                                          overflow: TextOverflow.ellipsis)))
                                  : Text(data.totalModuleDuMois,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          height: 1.8,
                                          letterSpacing: 1,
                                          decoration: TextDecoration.none,
                                          overflow:
                                          TextOverflow.ellipsis))),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialog(context, snapshot, int index) {
    int valueId = snapshot.data![index].id!.toInt();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: white,
            contentPadding: const EdgeInsets.all(20),
            title: Text("Supprimer ce mois ?",
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        decoration: TextDecoration.none))),
            content: Text(
                "Il sera supprimé définitivement, Il sera donc impossible de récupérer les données.",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: black,
                        fontSize: 13,
                        decoration: TextDecoration.none))),
            elevation: 5,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dbHelperHoraire!.deleteData(valueId);
                            dataList = dbHelperHoraire!.getDataList();
                            snapshot.data!.remove(snapshot.data![index]);
                            Navigator.of(context).pop();
                          });
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: red),
                        child: Text(
                          "Supprimer",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: white,
                                  fontSize: 13,
                                  decoration: TextDecoration.none)),
                        )),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: grey),
                        child: Text(
                          "Annuler",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: white,
                                  fontSize: 13,
                                  decoration: TextDecoration.none)),
                        )),
                  ),
                ],
              )
            ],
          );
        });
  }
}


