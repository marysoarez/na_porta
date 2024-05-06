import 'dart:convert';

import 'package:na_porta/scr/models/order_model.dart';
import 'package:http/http.dart' as http;

class OrderRepository {
  Future<List<Order>> fetchOrderFromAPI() async {
    final response = await http.get(
        Uri.parse(
            "https://12983890-bc94-406d-94c9-aa573207d0c9.mock.pstmn.io/teste"),
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
