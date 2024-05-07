import 'dart:convert';

import 'package:na_porta/scr/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
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
}
