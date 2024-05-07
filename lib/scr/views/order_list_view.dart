import 'package:flutter/material.dart';
import 'package:na_porta/scr/viewModel/order_list_view_model.dart';
import 'package:na_porta/scr/widgets/new_order_button.dart';
import 'package:na_porta/scr/widgets/resume.dart';

import 'order_detail_view.dart';

class ListPage extends StatefulWidget {
  final OrderListViewModel viewModel;

  const ListPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(246, 152, 74, 1),
            ),
            height: 207,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 58,
                    height: 60,
                  ),
                  NewOrderButton(onPressed: () {}, text: "Novo Pedido")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pedidos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  FutureBuilder(
                    future: widget.viewModel.fetchOrders(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Erro ao listar Pedidos"),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("sem pedidos"),
                        );
                      } else {
                        return Container(
                          height: 400,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              var order = snapshot.data![index];
                              return GestureDetector(
                                child: ResumeWidget(
                                  destinationTime:
                                      order.destinationTime.toString(),
                                  destinationDate:
                                      order.destinationDate.toString(),
                                  oNumber: order.oNumber.toString(),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PedidoDetailPage()),
                                  );
                                },
                              );
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
