
import '../models/order_model.dart';

abstract class OrderRepository {
  Future<List<Order>> fetchOrderFromAPI();

  Future<List<Order>> getOrders();
  Future<void> insertOrder(Order order);
}
