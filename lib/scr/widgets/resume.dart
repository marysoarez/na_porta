import 'package:flutter/material.dart';

class ResumeWidget extends StatefulWidget {
  const ResumeWidget({super.key});

  @override
  State<ResumeWidget> createState() => _ResumeWidgetState();
}

class _ResumeWidgetState extends State<ResumeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),


      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),

          borderRadius: BorderRadius.circular(
            6,
          ),
        ),
        height: 83,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "C8C3CE",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  Text(
                    "Previsão de entrega 10/10 às 13:30",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(85, 85, 85, 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
