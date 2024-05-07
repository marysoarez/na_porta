import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'database_service.dart';

class DatabaseServiceImpl implements DatabaseService{
  DatabaseServiceImpl._privateConstructor();

  static final DatabaseServiceImpl instance = DatabaseServiceImpl._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'orders.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, origin TEXT, destination TEXT, oNumber TEXT, originDate TEXT, originTime TEXT, destinationDate TEXT, destinationTime TEXT, clientName TEXT, clientEmail TEXT, clientPhone TEXT)',
        );
      },
      version: 1,
    );
  }


}
