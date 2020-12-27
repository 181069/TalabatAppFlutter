

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
    path += 'favorit.db';
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''
          create table favorit (
            id integer primary key autoincrement,
			rest_id integer primary key autoincrement,
            rest_name text not null,
            image text not null,
            price real not null
          )
          ''');
      },
    );
  }


  Future<List<RestuItem>> get favorit async {
    final db = await database;
    List<Map> result = await db.query('favorit', orderBy: 'id asc');
    List<RestuItem> ritem = [];
    for (var value in result) {
      ritem.add(RestuItem.fromMap(value));
    }
    return ritem;
  }

Future insert(RestuItem Ritem) async {
  final db = await database;
  return await db.insert('favorit', Ritem.toMap());
}




Future<int> removefavorite(int id) async {
  final db = await database;
  return await db.delete('favorit', where: 'id=?', whereArgs: [id]);
}


}





