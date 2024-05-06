import 'package:flutter/material.dart';

class ClienteInfoWidget extends StatefulWidget {
  const ClienteInfoWidget({super.key});

  @override
  State<ClienteInfoWidget> createState() => _ClienteInfoWidgetState();
}

class _ClienteInfoWidgetState extends State<ClienteInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cliente",
            style: TextStyle(
              color: Color.fromRGBO(141, 141, 153, 1),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            "Jon Doe",
            style: TextStyle(
              color: Color.fromRGBO(85, 85, 85, 1),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            "john.doe@teste.com",
            style: TextStyle(
              color: Color.fromRGBO(85, 85, 85, 1),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            "+55 11 99000-0023",
            style: TextStyle(
              color: Color.fromRGBO(85, 85, 85, 1),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
