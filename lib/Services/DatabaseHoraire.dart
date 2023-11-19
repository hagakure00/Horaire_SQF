import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import '../Models/HoraireModel.dart';

class DBHelperHoraire {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Horaire.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async {
    await db.execute("""CREATE TABLE horaire(
          "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
          "mois" TEXT NOT NULL, 
          "date" TEXT NOT NULL,
          "module" TEXT NOT NULL,
          "s1d1a" TEXT NOT NULL,
          "s1d1d" TEXT NOT NULL,
          "s1d1t" TEXT NOT NULL,
          "s1d2a" TEXT NOT NULL,
          "s1d2d" TEXT NOT NULL,
         "s1d2t" TEXT NOT NULL,
         "s1d3a" TEXT NOT NULL,
         "s1d3d" TEXT NOT NULL,
         "s1d3t" TEXT NOT NULL,
          "s1d4a" TEXT NOT NULL,
          "s1d4d" TEXT NOT NULL,
         "s1d4t" TEXT NOT NULL,
          "s1d5a" TEXT NOT NULL,
          "s1d5d" TEXT NOT NULL,
          "s1d5t" TEXT NOT NULL,
          "s1d6a" TEXT NOT NULL,
          "s1d6d" TEXT NOT NULL,
         "s1d6t" TEXT NOT NULL,
          "totals1" TEXT NOT NULL,
         "s2d1a" TEXT NOT NULL,
          "s2d1d" TEXT NOT NULL,
          "s2d1t" TEXT NOT NULL,
          "s2d2a" TEXT NOT NULL,
         "s2d2d" TEXT NOT NULL,
          "s2d2t" TEXT NOT NULL,
          "s2d3a" TEXT NOT NULL,
          "s2d3d" TEXT NOT NULL,
          "s2d3t" TEXT NOT NULL,
          "s2d4a" TEXT NOT NULL,
          "s2d4d" TEXT NOT NULL,
          "s2d4t" TEXT NOT NULL,
          "s2d5a" TEXT NOT NULL,
         "s2d5d" TEXT NOT NULL,
          "s2d5t" TEXT NOT NULL,
          "s2d6a" TEXT NOT NULL,
          "s2d6d" TEXT NOT NULL,
         "s2d6t" TEXT NOT NULL,
         "totals2" TEXT NOT NULL,
      "s3d1a" TEXT NOT NULL,
      "s3d1d" TEXT NOT NULL,
      "s3d1t" TEXT NOT NULL,
      "s3d2a" TEXT NOT NULL,
      "s3d2d" TEXT NOT NULL,
      "s3d2t" TEXT NOT NULL,
      "s3d3a" TEXT NOT NULL,
      "s3d3d" TEXT NOT NULL,
      "s3d3t" TEXT NOT NULL,
      "s3d4a" TEXT NOT NULL,
      "s3d4d" TEXT NOT NULL,
      "s3d4t" TEXT NOT NULL,
      "s3d5a" TEXT NOT NULL,
      "s3d5d" TEXT NOT NULL,
      "s3d5t" TEXT NOT NULL,
      "s3d6a" TEXT NOT NULL,
      "s3d6d" TEXT NOT NULL,
      "s3d6t" TEXT NOT NULL,
      "totals3" TEXT NOT NULL,
      "s4d1a" TEXT NOT NULL,
      "s4d1d" TEXT NOT NULL,
      "s4d1t" TEXT NOT NULL,
      "s4d2a" TEXT NOT NULL,
      "s4d2d" TEXT NOT NULL,
      "s4d2t" TEXT NOT NULL,
      "s4d3a" TEXT NOT NULL,
      "s4d3d" TEXT NOT NULL,
      "s4d3t" TEXT NOT NULL,
      "s4d4a" TEXT NOT NULL,
      "s4d4d" TEXT NOT NULL,
      "s4d4t" TEXT NOT NULL,
      "s4d5a" TEXT NOT NULL,
      "s4d5d" TEXT NOT NULL,
      "s4d5t" TEXT NOT NULL,
      "s4d6a" TEXT NOT NULL,
      "s4d6d" TEXT NOT NULL,
      "s4d6t" TEXT NOT NULL,
      "totals4" TEXT NOT NULL,
      "s5d1a" TEXT NOT NULL,
      "s5d1d" TEXT NOT NULL,
      "s5d1t" TEXT NOT NULL,
      "s5d2a" TEXT NOT NULL,
      "s5d2d" TEXT NOT NULL,
      "s5d2t" TEXT NOT NULL,
      "s5d3a" TEXT NOT NULL,
      "s5d3d" TEXT NOT NULL,
      "s5d3t" TEXT NOT NULL,
      "s5d4a" TEXT NOT NULL,
      "s5d4d" TEXT NOT NULL,
      "s5d4t" TEXT NOT NULL,
      "s5d5a" TEXT NOT NULL,
      "s5d5d" TEXT NOT NULL,
      "s5d5t" TEXT NOT NULL,
      "s5d6a" TEXT NOT NULL,
      "s5d6d" TEXT NOT NULL,
      "s5d6t" TEXT NOT NULL,
      "totals5" TEXT NOT NULL,
      "notifs1" TEXT NOT NULL,
      "notifs2" TEXT NOT NULL,
      "notifs3" TEXT NOT NULL,
      "notifs4" TEXT NOT NULL,
      "notifs5" TEXT NOT NULL,
      "totalHeureDuMois" TEXT NOT NULL,
      "totalModuleDuMois" TEXT NOT NULL,
      "contratHoraire" TEXT NOT NULL,
      "tempsPause" TEXT NOT NULL,
      "absence" TEXT NOT NULL,
      "heureSup" TEXT NOT NULL,
      "congePaye" TEXT NOT NULL,
      "cpS1j1" TEXT NOT NULL,
      "cpS1j2" TEXT NOT NULL,
      "cpS1j3" TEXT NOT NULL,
      "cpS1j4" TEXT NOT NULL,
      "cpS1j5" TEXT NOT NULL,
      "cpS2j1" TEXT NOT NULL,
      "cpS2j2" TEXT NOT NULL,
      "cpS2j3" TEXT NOT NULL,
      "cpS2j4" TEXT NOT NULL,
      "cpS2j5" TEXT NOT NULL,
      "cpS3j1" TEXT NOT NULL,
      "cpS3j2" TEXT NOT NULL,
      "cpS3j3" TEXT NOT NULL,
      "cpS3j4" TEXT NOT NULL,
      "cpS3j5" TEXT NOT NULL,
      "cpS4j1" TEXT NOT NULL,
      "cpS4j2" TEXT NOT NULL,
      "cpS4j3" TEXT NOT NULL,
      "cpS4j4" TEXT NOT NULL,
      "cpS4j5" TEXT NOT NULL,
      "cpS5j1" TEXT NOT NULL,
      "cpS5j2" TEXT NOT NULL,
      "cpS5j3" TEXT NOT NULL,
      "cpS5j4" TEXT NOT NULL,
      "cpS5j5" TEXT NOT NULL,
      "year" TEXT NOT NULL,
      "samedi" TEXT NOT NULL
      )""");
  }

  Future<HoraireModel> insertData(HoraireModel horaire) async {
    var dbClient = await db;
    await dbClient?.insert("horaire", horaire.toMap());
    return horaire;
  }

  Future<List<HoraireModel>> getDataList() async {
    await db;
    final List<Map<String, Object?>> queryResult =
        await _db!.rawQuery('SELECT * FROM horaire ORDER BY date DESC');
    return queryResult.map((e) => HoraireModel.fromMap(e)).toList();
  }

  Future<int> deleteData(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('horaire', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateData(HoraireModel horaire) async {
    var dbClient = await db;
    return await dbClient!.update('horaire', horaire.toMap(),
        where: 'id = ?', whereArgs: [horaire.id]);
  }

  Future<String> getData() async {
    var dbClient = await db;
    String data;
    final query = await dbClient!.rawQuery('SELECT * FROM horaire');
    if (query.isEmpty) {
      return '0';
    } else {
      data = query.last["totalModuleDuMois"].toString();
      return data;
    }
  }


  getDbPath() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Horaire.db');
    String databasePath = path;
    if (kDebugMode) {
      print('=======================databasePath :  $databasePath');
    }
    io.Directory? externalStoragepath = await getExternalStorageDirectory();
    if (kDebugMode) {
      if (kDebugMode) {
        print("=======================externalStoragepath :  $externalStoragepath");
      }
    }
  }

  String dbFilepath = "/data/user/0/com.horaire.horaire/app_flutter/Horaire.db";
  String folderPathForDbFilePath = "/storage/emulated/0/HoraireDatabase";

  backUpDb() async {
    var status = await Permission.manageExternalStorage.request();

    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.storage.request();
    } try {
      File dbFile = File(dbFilepath);
      io.Directory folderPathForDbFile = Directory(folderPathForDbFilePath);
      await folderPathForDbFile.create();
      await dbFile.copy("$folderPathForDbFilePath/Horaire.db");
     } catch (e) {
       if (kDebugMode) {
         print("========================= error : ${e.toString()}");
       }
     }
  }

  restoreDb() async {
    var status = await Permission.manageExternalStorage.request();
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.storage.request();
    }
    try {
      File savedDbFile = File('$folderPathForDbFilePath/Horaire.db');
      if (savedDbFile.existsSync()) {
        await savedDbFile.copy(dbFilepath);
      } else {
        FilePickerResult? resultPicker = await FilePicker.platform.pickFiles();
        File source = File(resultPicker!.files.single.path!);
        await source.copy(dbFilepath);
      }
      // await savedDbFile.copy(dbFilepath);
    } catch (e) {
      if (kDebugMode) {
        print("========================= error : ${e.toString()}");
      }
    }
  }

}
