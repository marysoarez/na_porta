import 'client_model.dart';

class Order {
  int? id;
  String origin;
  String destination;
  String oNumber;

  String originDate;
  String originTime;
  String destinationDate;
  String destinationTime;

  List<Client> clients;

  Order({
    this.id,
    required this.origin,
    required this.destination,
    required this.oNumber,
    required this.originDate,
    required this.originTime,
    required this.destinationDate,
    required this.destinationTime,
    required this.clients,
  });
}
