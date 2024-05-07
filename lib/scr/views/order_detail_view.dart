import 'package:flutter/material.dart';
import 'package:na_porta/scr/widgets/client_info_widget.dart';
import 'package:na_porta/scr/widgets/destino_widget.dart';
import 'package:na_porta/scr/widgets/info_order_widget.dart';
import 'package:na_porta/scr/widgets/map/map_widget.dart';
import 'package:na_porta/scr/widgets/partida_widget.dart';

import '../models/order_model.dart';

class PedidoDetailPage extends StatelessWidget {
  final Order order;

  const PedidoDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${order.oNumber}',
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromRGBO(246, 152, 74, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //espaçamento do header
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(246, 152, 74, 1),
            ),
          ),

          //mapa
          MapWidget(
            destination: '${order.destination}',
            origin: '${order.origin}',
          ),

          //informações
          Container(
            padding: const EdgeInsets.all(10),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PartidaWidget(
                  origin: '${order.origin}',
                  originTime: '${order.originTime}',
                  originDate: '${order.originDate}',
                ),
                SizedBox(
                  height: 50,
                ),
                DestinoWidget(
                  destination: '${order.destination}',
                  destinationDate: '${order.destinationDate}',
                  destinationTime: '${order.destinationTime}',
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoPedidoWidget(),
                      SizedBox(height: 20),
                      ClienteInfoWidget(
                        email: '${order.clientEmail}',
                        name: '${order.clientName}',
                        phone: '${order.clientPhone}',
                      ),
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
