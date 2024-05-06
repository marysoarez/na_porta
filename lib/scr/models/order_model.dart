
class Order {
  int? id;
  String? origin;
  String? destination;
  String? oNumber;

  String? originDate;
  String? originTime;
  String? destinationDate;
  String? destinationTime;
  String? clientName;
  String? clientEmail;
  String? clientPhone;

  Order({
    this.id,
    this.origin,
    this.destination,
    this.oNumber,
    this.originDate,
    this.originTime,
    this.destinationDate,
    this.destinationTime,
    this.clientName,
    this.clientEmail,
    this.clientPhone,
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
      clientName: json['clientName'],
      clientEmail: json['clientEmail'],
      clientPhone: json['clientPhone'],
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
      'clientName': clientName,
      'clientEmail': clientEmail,
      'clientPhone': clientPhone,
    };
  }
}
