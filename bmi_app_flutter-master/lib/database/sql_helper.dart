import 'package:sqflite/sqflite.dart' as sql;


// Abschnit 1 bis Zeile 38 Sql lite

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

  // Neuer Teil für die User Abschnitt





  static Future saveUser(String username) async {
    final db = await SQLHelper.db();
    final data = {'username': username};
    final id = await db.insert('Users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> loadUser() async {
    final db = await SQLHelper.db();
    return db.query('Users', orderBy: "createdAt DESC");
  }

  static Future saveUserList(List<String> users) async {
    final db = await SQLHelper.db();
    for (var user in users) {
      final data = {'username': user};
      final id = await db.insert('Users', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }

  static Future<List<Map<String, dynamic>>> loadUserList() async {
    final db = await SQLHelper.db();
    return db.query('Users', orderBy: "createdAt DESC");
  }

  static Future saveBmi(double height, double weight, int userId) async {
    final db = await SQLHelper.db();

    final data = {'height': height, 'weight': weight, 'userId': userId};
    final id = await db.insert('Bmi', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> loadBmi() async {
    final db = await SQLHelper.db();
    return db.query('Bmi', orderBy: "createdAt DESC");
  }


  static Future saveBmiList(List<Bmi> bmis) async {
    final db = await SQLHelper.db();
    for (var bmi in bmis) {
      final data = {'height': bmi.height, 'weight': bmi.weight, 'userId': bmi.userId};
      final id = await db.insert('Bmi', data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    }
  }
  // save my Bmilist in bmi_history_page.dart

  static Future<List<Map<String, dynamic>>> loadBmiList() async {
    final db = await SQLHelper.db();
    return db.query('Bmi', orderBy: "createdAt DESC");
  }
  // load my Bmilist in bmi_history_page.dart

  static Future<List<Map<String, dynamic>>> loadBmiListForUser(int userId) async {
    final db = await SQLHelper.db();
    return db.query('Bmi', where: 'userId = ?', whereArgs: [userId], orderBy: "createdAt DESC");
  }

  static Future<List<Map<String, dynamic>>> loadBmiListForUserWithUsername(String username) async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT Bmi.id, Bmi.height, Bmi.weight, Bmi.createdAt, Users.username FROM Bmi INNER JOIN Users ON Bmi.userId = Users.id WHERE Users.username = ?', [username]);
  }

  static Future<List<Map<String, dynamic>>> loadBmiListForUserWithUsernameAndDate(String username, String date) async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT Bmi.id, Bmi.height, Bmi.weight, Bmi.createdAt, Users.username FROM Bmi INNER JOIN Users ON Bmi.userId = Users.id WHERE Users.username = ? AND Bmi.createdAt LIKE ?', [username, date + '%']);
  }

  static Future<List<Map<String, dynamic>>> loadBmiListForUserWithUsernameAndDateRange(String username, String startDate, String endDate) async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT Bmi.id, Bmi.height, Bmi.weight, Bmi.createdAt, Users.username FROM Bmi INNER JOIN Users ON Bmi.userId = Users.id WHERE Users.username = ? AND Bmi.createdAt BETWEEN ? AND ?', [username, startDate, endDate]);
  }

  static Future deleteBmi(int id) async {
    final db = await SQLHelper.db();
    await db.delete('Bmi', where: 'id = ?', whereArgs: [id]);
  }

  static Future deleteBmiList() async {
    final db = await SQLHelper.db();
    await db.delete('Bmi');
  }

  static Future deleteBmiListForUser(int userId) async {
    final db = await SQLHelper.db();
    await db.delete('Bmi', where: 'userId = ?', whereArgs: [userId]);
  }

  static Future deleteBmiListForUserWithUsername(String username) async {
    final db = await SQLHelper.db();
    await db.rawQuery('DELETE FROM Bmi WHERE userId IN (SELECT id FROM Users WHERE username = ?)', [username]);
  }





}

class Bmi {
  final int id;
  final double height;
  final double weight;
  final int userId;
  final DateTime createdAt;

  Bmi(this.id, this.height, this.weight, this.userId, this.createdAt);

  Bmi.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        height = json['height'],
        weight = json['weight'],
        userId = json['userId'],
        createdAt = DateTime.parse(json['createdAt']);

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'height': height,
        'weight': weight,
        'userId': userId,
        'createdAt': createdAt.toIso8601String(),

      };


}


