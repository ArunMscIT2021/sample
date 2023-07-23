import 'package:sqflite/sqflite.dart' as sql;

class CompanyData {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      address TEXT,
      jobType TEXT,
      companyProfile TEXT,
      requirements TEXT,
      contactName TEXT,
      email TEXT,
      mobile TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'Company.db',
      version: 1,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  static Future<int> createItem(
    String title,
    String? description,
    String? address,
    String? jobType,
    String? companyProfile,
    String? requirements,
    String? contactName,
    String? email,
    String? mobile,
  ) async {
    final db = await CompanyData.db();
    final data = {
      'title': title,
      'description': description,
      'address': address,
      'jobType': jobType,
      'companyProfile': companyProfile,
      'requirements': requirements,
      'contactName': contactName,
      'email': email,
      'mobile': mobile,
    };
    return db.insert(
      'items',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await CompanyData.db();
    return db.query('items', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await CompanyData.db();
    return db.query('items', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String title,
    String? description,
    String? address,
    String? jobType,
    String? companyProfile,
    String? requirements,
    String? contactName,
    String? email,
    String? mobile,
  ) async {
    final db = await CompanyData.db();
    final data = {
      'title': title,
      'description': description,
      'address': address,
      'jobType': jobType,
      'companyProfile': companyProfile,
      'requirements': requirements,
      'contactName': contactName,
      'email': email,
      'mobile': mobile,
      'createdAt': DateTime.now().toString(),
    };
    return db.update('items', data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteItem(int id) async {
    final db = await CompanyData.db();
    await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}
