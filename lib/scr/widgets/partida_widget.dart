import 'package:flutter/material.dart';

class PartidaWidget extends StatelessWidget {
  final String origin;
  final String originDate;
  final String originTime;

  const PartidaWidget({
    super.key,
    required this.origin,
    required this.originDate,
    required this.originTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Icons.car_rental,
              size: 22,
              color: Color.fromRGBO(225, 225, 225, 1),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saindo de $origin',
                  maxLines: 3,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(85, 85, 85, 1),
                  ),
                ),
                Text(
                  "$originDate às $originTime",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(85, 85, 85, 1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
