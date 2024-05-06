import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:na_porta/scr/models/order_model.dart';

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

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

  Future<void> insertOrder(Order order) async {
    final Database db = await database;
    await db.insert(
      'orders',
      order.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Order>> getOrders() async {
    final Database db = await database;
    final List<Map<String, dynamic>> orderMaps = await db.query('orders');
    return orderMaps.map((orderMap) => Order.fromJson(orderMap)).toList();
  }
}

