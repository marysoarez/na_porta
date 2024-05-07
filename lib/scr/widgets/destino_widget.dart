import 'package:flutter/material.dart';

class DestinoWidget extends StatelessWidget {
  final String destination;
  final String destinationDate;
  final String destinationTime;


  const DestinoWidget({super.key, required this.destination, required this.destinationDate, required this.destinationTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  6,
                ),
                color: const Color.fromRGBO(246, 152, 74, 1),
              ),
              height: 46,
              width: 46,
              child: const Icon(
                Icons.flag,
                size: 22,
                color: Color.fromRGBO(225, 225, 225, 1),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chegando em ${destination}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    )),
                Text(
                  "${destinationDate} às ${destinationTime}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(85, 85, 85, 1),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
