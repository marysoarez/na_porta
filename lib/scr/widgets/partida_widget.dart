import 'package:flutter/material.dart';

class PartidaWidget extends StatefulWidget {
  const PartidaWidget({super.key});

  @override
  State<PartidaWidget> createState() => _PartidaWidgetState();
}

class _PartidaWidgetState extends State<PartidaWidget> {
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
                color: Color.fromRGBO(246, 152, 74, 1),
              ),
              height: 46,
              width: 46,
              child: Icon(
                Icons.car_rental,
                size: 22,
                color: Color.fromRGBO(225, 225, 225, 1),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Saindo de Avenida Paulista, 807 - Bela Vista",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    )),
                Text(
                  "17/02/2023 às 13:30",
                  style: TextStyle(fontWeight: FontWeight.w400,
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
