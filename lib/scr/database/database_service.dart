import 'package:na_porta/scr/models/client_model.dart';
import 'package:na_porta/scr/models/order_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
      join(await getDatabasesPath(), 'orders_db.db'),
      onCreate: (db, version) {
         db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, origin TEXT, destination TEXT, oNumber TEXT, originDate TEXT, originTime TEXT, destinationDate TEXT, destinationTime TEXT, client TEXT)',
        );
         db.execute(
           'CREATE TABLE clients(id INTEGER PRIMARY KEY, orderId INTEGER, name TEXT, email TEXT, phone TEXT)',
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
    if (order.client != null) {
      for (Client client in order.client!) {
        await db.insert(
          'clients',
          {
            'orderId': order.id,
            'name': client.name,
            'email': client.email,
            'phone': client.phone,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }

  Future<List<Order>> getOrders() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        origin: maps[i]['origin'],
        destination: maps[i]['destination'],
        oNumber: maps[i]['oNumber'],
        originDate: maps[i]['originDate'],
        originTime: maps[i]['originTime'],
        destinationDate: maps[i]['destinationDate'],
        destinationTime: maps[i]['destinationTime'],
        client: maps[i]['client'],

      );
    });
  }
}
