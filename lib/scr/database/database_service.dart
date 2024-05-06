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
          client.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }

  Future<List<Order>> getOrders() async {
    final Database db = await database;
    final List<Map<String, dynamic>> orderMaps = await db.query('orders');


    final List<Order> orders = await Future.wait(orderMaps.map((orderMap) async {
      final List<Map<String, dynamic>> clientMaps = await db.query(
        'clients',
        where: 'orderId = ?',
        whereArgs: [orderMap['id']],
      );
      final List<Client> client = clientMaps.map((clientMap) {
        return Client(
          id: clientMap['id'],
          name: clientMap['name'],
          email: clientMap['email'],
          phone: clientMap['phone'],
        );
      }).toList();
      return Order.fromJson(orderMap)..client = client;
    }).toList());
    return orders;

  }
}
