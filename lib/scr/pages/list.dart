import 'package:flutter/material.dart';
import 'package:na_porta/scr/pages/order_detail_page.dart';
import 'package:na_porta/scr/widgets/resume.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

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
            decoration: BoxDecoration(
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
                  // Icon(
                  //   Icons.square,size: 60,
                  //   color: Colors.white,
                  // ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Novo Pedido",
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(85, 85, 85, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pedidos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  GestureDetector(
                    child: ResumeWidget(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PedidoDetailPage()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: ResumeWidget(),
                    onTap: () {
                      print('aaaaa');
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
