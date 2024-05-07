import 'package:flutter/material.dart';
import 'package:na_porta/scr/database/database_service.dart';
import 'package:na_porta/scr/models/map_model.dart';

class MapViewModel with ChangeNotifier {
 final DatabaseService _databaseService = DatabaseService.instance;

 late MapModel origin;
 late MapModel destination;

 MapViewModel() {
   _init();

 }

 Future<void> _init()async{
   await _databaseService.database;
   origin = (await _databaseService.getOrders()) as MapModel;

   notifyListeners();
 }

}