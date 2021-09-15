import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class SurathsDBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE suraths(id TEXT PRIMARY KEY, surah TEXT, simpleName TEXT,page TEXT, origin TEXT, verses TEXT, isFavorite TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(Map<String, dynamic> data) async {
    final db = await SurathsDBHelper.database();

    await db.insert(
      'suraths',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await SurathsDBHelper.database();
    return db.query('suraths');
  }

  static Future<void> update(Map<String, dynamic> data) async {
    final db = await SurathsDBHelper.database();
    await db.update('suraths', data, where: "id = ?", whereArgs: [data['id']]);
  }
}
