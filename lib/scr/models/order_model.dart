import 'client_model.dart';

class Order {
  int? id;
  String? origin;
  String? destination;
  String? oNumber;

  String? originDate;
  String? originTime;
  String? destinationDate;
  String? destinationTime;

  List<Client>? client;

  Order({
    this.id,
    this.origin,
    this.destination,
    this.oNumber,
    this.originDate,
    this.originTime,
    this.destinationDate,
    this.destinationTime,
    this.client,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      origin: json['origin'],
      destination: json['destination'],
      oNumber: json['oNumber'],
      originDate: json['originDate'],
      originTime: json['originTime'],
      destinationDate: json['destinationDate'],
      destinationTime: json['destinationTime'],
      client: json['client'] != null
          ? List<Client>.from(json['client'].map((x) => Client.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'origin': origin,
      'destination': destination,
      'oNumber': oNumber,
      'originDate': originDate,
      'originTime': originTime,
      'destinationDate': destinationDate,
      'destinationTime': destinationTime,
      'client': client != null ? client!.map((x) => x.toJson()).toList() : null
    };
  }
}
