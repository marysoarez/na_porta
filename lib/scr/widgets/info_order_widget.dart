import 'package:flutter/material.dart';

class InfoPedidoWidget extends StatefulWidget {
  final String oNumber;
  const InfoPedidoWidget({super.key, required this.oNumber});

  @override
  State<InfoPedidoWidget> createState() => _InfoPedidoWidgetState();
}

class _InfoPedidoWidgetState extends State<InfoPedidoWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pedido",
          style: TextStyle(
              color: Color.fromRGBO(141, 141, 153, 1),
              fontSize: 14),
        ),
        Text(
          widget.oNumber,
          style: TextStyle(
              color: Color.fromRGBO(85, 85, 85, 1),
              fontSize: 32,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
