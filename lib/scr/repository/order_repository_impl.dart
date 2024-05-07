import 'dart:convert';

import 'package:na_porta/scr/database/database_service_impl.dart';
import 'package:na_porta/scr/models/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:na_porta/scr/repository/order_repository.dart';
import 'package:sqflite/sqflite.dart';

class OrderRepositoryImpl implements OrderRepository {
  Future<Database> _database() {
    return DatabaseServiceImpl.instance.database;
  }

  @override
  Future<List<Order>> fetchOrderFromAPI() async {
    final response = await http.get(
        Uri.parse(
            "https://6db02341-e024-4d8e-b3e5-f883c7f6aeae.mock.pstmn.io/orders"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      print(response.body);
      return jsonList.map((json) => Order.fromJson(json)).toList();
    } else {
      print(response.body);
      throw Exception('erro');
    }
  }

  @override
  Future<List<Order>> getOrders() async {
    final Database db = await _database();
    final List<Map<String, dynamic>> orderMaps = await db.query('orders');
    return orderMaps.map((orderMap) => Order.fromJson(orderMap)).toList();
  }

  @override
  Future<void> insertOrder(Order order) async {
    final Database db = await _database();

    await db.insert(
      'orders',
      order.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
