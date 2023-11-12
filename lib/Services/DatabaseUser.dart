import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import '../Models/UserModel.dart';

class DBHelperUser{
  static Database? _db;


  Future<Database?> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDatabaseUser();
    return null;
  }

  initDatabaseUser() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'user.db');
    var db = await openDatabase(path, version: 2, onCreate: _createDatabaseUser);
    return db;
  }

  _createDatabaseUser(Database db, int version) async {
    await db.execute( """CREATE TABLE user(
          "contrat" TEXT NOT NULL, 
          "pause" TEXT NOT NULL
    )""");
  }

  Future<UserModel> insertDataUser(UserModel user) async {
    var dbClient = await db;
    await dbClient?.insert("user", user.toMap());
    return user;
  }

  Future<List<UserModel>> getDataListUser() async {
    await db;
    final List<Map<String, Object?>> queryResult = await _db!.rawQuery('SELECT * FROM user');
    return queryResult.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> updateDataUser(UserModel user) async {
    var dbClient = await db;
    return await dbClient!.update('user', user.toMap());
  }

  Future<String> getColorTheme() async {
    var dbClient = await db;
    String data;
    final query = await dbClient!.rawQuery('SELECT * FROM user');
    if (query.isEmpty) {
      return '';
    } else {
      data = query.last["colorTheme"].toString();
      return data;
    }
  }

}
