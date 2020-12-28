

import 'package:proj2fatisr/FavItem.dart';
import 'package:proj2fatisr/resturantitem.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  static final int version = 1;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    path += 'favorit4.db';
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''
          create table favorit4 (
            id integer primary key autoincrement,
			rest_Name text not null,
            name text not null,
            descr text not null,
            image text not null,
            price integer not null
          )
          ''');
      },
    );
  }


  Future<List<FavItem>> get favorit4 async {
    final db = await database;
    List<Map> result = await db.query('favorit4', orderBy: 'id asc');
    List<FavItem> ritem = [];
    for (var value in result) {
      ritem.add(FavItem.fromMap(value));
    }
    return ritem;
  }

Future insert(FavItem Ritem) async {
  final db = await database;
  return await db.insert('favorit4', Ritem.toMap());
}




Future<int> removefavorite(int id) async {
  final db = await database;
  return await db.delete('favorit4', where: 'id=?', whereArgs: [id]);
}


}





