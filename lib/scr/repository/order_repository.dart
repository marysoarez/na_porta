import 'dart:convert';

import 'package:na_porta/scr/models/order_model.dart';
import 'package:http/http.dart' as http;


class OrderRepository{

  Future<List<Order>> fetchOrderFromAPI()async {
    final response = await http.get(Uri.parse("uri"));
    if(response.statusCode == 200){
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Order.fromJson(json)).toList();
    }
    else {
      throw Exception('erro');
    }
  }
}