import 'package:na_porta/scr/models/order_model.dart';

import '../repository/order_repository.dart';

class OrderListViewModel {
  final OrderRepository repository;

  OrderListViewModel({
    required this.repository,
  });

  Future<List<Order>> fetchOrders() async {
    try {
      List<Order> orders = await repository.getOrders();

      if (orders.isEmpty) {
        orders = await repository.fetchOrderFromAPI();

        for (Order order in orders) {
          await repository.insertOrder(order);
        }
      }
      return orders;
    } catch (e) {
      throw Exception("Erro ao retornar Pedidos $e");
    }
  }
}
