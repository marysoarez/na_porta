import 'package:flutter/material.dart';
import 'package:na_porta/scr/database/database_service.dart';
import 'package:na_porta/scr/pages/list.dart';
import 'package:na_porta/scr/pages/order_detail_page.dart';
import 'package:na_porta/scr/repository/order_repository.dart';
import 'package:na_porta/scr/viewModel/order_list_view_model.dart';

void main() {
  //resolver isso aqui
  final OrderRepository orderRepository = OrderRepository();
  final DatabaseService databaseService = DatabaseService.instance;
  final OrderListViewModel orderListViewModel = OrderListViewModel(
      repository: orderRepository, databaseService: databaseService);


  runApp( MyApp(orderListViewModel: orderListViewModel));
}

class MyApp extends StatelessWidget {
  final OrderListViewModel orderListViewModel;

  const MyApp({super.key, required this.orderListViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ListPage(viewModel: orderListViewModel),
    );
  }
}
