import 'package:flutter/material.dart';

class ClienteInfoWidget extends StatefulWidget {

  final String name;
  final String email;
  final String phone;

  const ClienteInfoWidget({super.key, required this.name, required this.email, required this.phone});

  @override
  State<ClienteInfoWidget> createState() => _ClienteInfoWidgetState();
}

class _ClienteInfoWidgetState extends State<ClienteInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
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
          widget.name,
          style: TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Text(
          widget.email,
          style: TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Text(
          widget.phone,
          style: TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
