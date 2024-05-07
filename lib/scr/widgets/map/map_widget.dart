import 'dart:async';
import 'dart:convert';
 // import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:na_porta/scr/repository/map_repository.dart';

class MapWidget extends StatefulWidget {
  final String origin;
  final String destination;

  const MapWidget({
    super.key,
    required this.origin,
    required this.destination,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  // final Completer<GoogleMapController> _controller = Completer();
  LatLng? originLoc;
  LatLng? destinationLoc;

  Future<void> coord(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      for (var location in locations) {
        print("Latitude: ${location.latitude}, Longitude: ${location.longitude}");
      }

    } catch (e) {
      print("Erro ao obter coordenadas: $e");
    }
  }
  void teste() {
    coord("Rua João Paranaguá,190- Guadalupe");
  }


  // static const LatLng originLoc = LatLng(37.33500926, -122.03272188);
  // static const LatLng destinationLoc = LatLng(37.33429383, -122.06600055);

  // final String _addressOrigin =origin;

  // void tete() async {
  //   GeoCode geoCode = GeoCode();
  //
  //   try {
  //     Coordinates coordinates = await geoCode.forwardGeocoding(
  //         address: "Rua 1650 Amphitheatre Pkwy, Bairro Santa Clara County, Cidade Mountain View, Estado California, Pais United States, CEP: 94043");
  //
  //     print("Latitude: ${coordinates.latitude}");
  //     print("Longitude: ${coordinates.longitude}");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  //
  // Future<void> convertAddressToLatLng() async {
  //   originLoc = await getLocationFromAddress(widget.origin);
  //   destinationLoc = await getLocationFromAddress(widget.destination);
  //   setState(() {});
  // }
  //
  // Future<LatLng?> getLocationFromAddress(String address) async {
  //   final apiKey = google_api_key;
  //   final endpoint = 'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
  //   final response = await http.get(Uri.parse(endpoint));
  //   if (response.statusCode == 200) {
  //     final decoded = json.decode(response.body);
  //     if (decoded['status'] == 'OK') {
  //       final location = decoded['results'][0]['geometry']['location'];
  //       final lat = location['lat'];
  //       final lng = location['lng'];
  //
  //
  //       return LatLng(lat, lng);
  //     } else {
  //       throw Exception(decoded['status']);
  //     }
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }
  //

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = (await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(originLoc!.latitude, originLoc!.longitude),
      PointLatLng(destinationLoc!.latitude, destinationLoc!.longitude),
    ));
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    teste();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: originLoc ?? LatLng(0, 0),
          zoom: 12,
        ),
        polylines: {
          if (polylineCoordinates.isNotEmpty)
            Polyline(
              polylineId: PolylineId("rota"),
              points: polylineCoordinates,
              color: Color.fromRGBO(246, 152, 74, 1),
              width: 6,
            ),
        },
        markers: {
          if (originLoc != null)
            Marker(
              markerId: MarkerId("Origem"),
              position: originLoc!,
            ),
          if (destinationLoc != null)
            Marker(
              markerId: MarkerId("Destino"),
              position: destinationLoc!,
            ),
        },
      ),
    );
  }
}
