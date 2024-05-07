import 'package:flutter/material.dart';
import 'package:na_porta/scr/database/database_service.dart';
import 'package:na_porta/scr/models/map_model.dart';

class MapViewModel with ChangeNotifier {

  final MapModel _model = MapModel();


  void addMarker(){}
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}