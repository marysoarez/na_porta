import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:na_porta/scr/models/map_model.dart';
import 'package:na_porta/scr/repository/map_repository.dart';

class MapWidget extends StatefulWidget {
  final MapModel? mapmodel;
  const MapWidget({super.key,  this.mapmodel});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng originLoc = LatLng(37.33500926, -122.03272188);
  static const LatLng destinationLoc = LatLng(37.33429383, -122.06600055);

  String _address = "1600 Amphitheatre Parkway, Mountain View, CA";

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = (await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(originLoc.latitude, originLoc.longitude),
      PointLatLng(destinationLoc.latitude, destinationLoc.longitude),
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
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        // color: Colors.red,
        child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: originLoc,
              zoom: 12,
            ),
            polylines: {
              Polyline(
                  polylineId: PolylineId("rota"),
                  points: polylineCoordinates,
                  color: Color.fromRGBO(246, 152, 74, 1),
                  width: 6),
            },
            markers: {
              Marker(
                markerId: MarkerId("Origem"),
                position: originLoc,
              ),
              Marker(markerId: MarkerId("Destino"), position: destinationLoc),
            }));
  }
}
