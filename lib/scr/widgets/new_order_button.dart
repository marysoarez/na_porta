import 'package:flutter/material.dart';

class NewOrderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const NewOrderButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      )),
    ),
      onPressed: () {},
      child:  Text(
        text,
        style: const TextStyle(
            fontSize: 16, color: Color.fromRGBO(85, 85, 85, 1)),
      ),
    );
  }
}
