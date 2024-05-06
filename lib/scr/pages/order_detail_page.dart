import 'package:flutter/material.dart';
import 'package:na_porta/scr/widgets/client_info_widget.dart';
import 'package:na_porta/scr/widgets/destino_widget.dart';
import 'package:na_porta/scr/widgets/info_order_widget.dart';
import 'package:na_porta/scr/widgets/partida_widget.dart';

class PedidoDetailPage extends StatefulWidget {
  const PedidoDetailPage({super.key});

  @override
  State<PedidoDetailPage> createState() => _PedidoDetailPageState();
}

class _PedidoDetailPageState extends State<PedidoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( iconTheme: IconThemeData(
          color: Colors.white
      ),
        title: Text(
          "Pedido C3C8CE",
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Color.fromRGBO(246, 152, 74, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //espaçamento do header
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 152, 74, 1),
            ),
          ),

          //mapa
          Container(

            height: 230,
            color: Colors.red,
          ),

          //informações
          Container(
            padding: EdgeInsets.all(10),
            // decoration: BoxDecoration(color: Colors.green),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PartidaWidget(),
                SizedBox(
                  height: 50,
                ),
                DestinoWidget(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoPedidoWidget(),
                      SizedBox(height: 20),
                      ClienteInfoWidget(),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
