import 'package:na_porta/scr/database/database_service.dart';
import 'package:na_porta/scr/models/order_model.dart';
import 'package:na_porta/scr/repository/order_repository.dart';

class OrderListViewModel{
  final OrderRepository repository;
  final DatabaseService databaseService;

  OrderListViewModel({required this.repository, required this.databaseService});

  Future<List<Order>> fetchOrders()async{
    try{
      List<Order> orders = await databaseService.getOrders();

      if(orders.isEmpty) {
        orders = await repository.fetchOrderFromAPI();

        for(Order order in orders) {
          await databaseService.insertOrder(order);
        }
      }
      return orders;
    }catch(e){
      throw Exception("Erro ao retornar Pedidos $e");
    }
  }

}