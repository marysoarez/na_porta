import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:na_porta/scr/repository/map_repository.dart';

class MapWidget extends StatefulWidget {
  final String origin;
  final String destination;

  const MapWidget({
    Key? key,
    required this.origin,
    required this.destination,
  }) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
    LatLng? originLoc;
    LatLng? destinationLoc;



  Future<LatLng> getCoordinates(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      } else {
        throw Exception(
            "Nenhuma coordenada encontrada para o endereço fornecido.");
      }
    } catch (e) {
      print("Erro ao obter coordenadas: $e");
      return LatLng(0, 0);
    }
  }

  void getAddressFromOrder() async {
    var origin = widget.origin;
    var destination = widget.destination;
    originLoc = await getCoordinates(origin);
    destinationLoc = await getCoordinates(destination);

    print(
        "Coordenadas de Origem: ${originLoc!.latitude}, ${originLoc!.longitude}");
    print(
        "Coordenadas de Destino: ${destinationLoc!.latitude}, ${destinationLoc!.longitude}");

    getPolyPoints(originLoc!, destinationLoc!);
  }

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints(LatLng origin, LatLng destination) async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
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
    getAddressFromOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: originLoc == null || destinationLoc == null
          ? Center(child: CircularProgressIndicator()) // Placeholder for loading state
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: originLoc!,
          zoom: 14,

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
          Marker(
            markerId: MarkerId("Origem"),
            position: originLoc!,
          ),
          Marker(
            markerId: MarkerId("Destino"),
            position: destinationLoc!,
          ),
        },
      ),
    );
  }
}
