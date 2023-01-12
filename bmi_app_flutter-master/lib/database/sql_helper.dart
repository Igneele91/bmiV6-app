import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static const String databaseName = "bmi";

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE bmi(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        height REAL,
        weight REAL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      databaseName + '.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(double height, double weight) async {
    final db = await SQLHelper.db();

    final data = {'height': height, 'weight': weight};
    final id = await db.insert(databaseName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getBmi() async {
    final db = await SQLHelper.db();
    return db.query(databaseName, orderBy: "createdAt DESC");
  }
}
