import 'package:flutter/material.dart';

class ResumeWidget extends StatefulWidget {
  final String oNumber;
  final String destinationDate;
  final String destinationTime;

  const ResumeWidget({
    super.key,
    required this.oNumber,
    required this.destinationDate,
    required this.destinationTime,
  });

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
          color: const Color.fromRGBO(255, 255, 255, 1),
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
                    widget.oNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  Text(
                    "Previsão de entrega ${widget.destinationDate} às ${widget.destinationTime}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                ],
              ),
              const Icon(
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
