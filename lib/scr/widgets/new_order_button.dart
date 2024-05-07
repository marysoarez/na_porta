import 'package:flutter/material.dart';

class NewOrderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const NewOrderButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child:  Text(
        text,
        style: const TextStyle(
            fontSize: 16, color: Color.fromRGBO(85, 85, 85, 1)),
      ),
    );
  }
}
