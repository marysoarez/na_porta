import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:na_porta/module/app_module.dart';
import 'package:na_porta/module/app_widget.dart';
import 'package:na_porta/scr/database/database_service_impl.dart';

void main() async{


  WidgetsFlutterBinding
      .ensureInitialized();
  await DatabaseServiceImpl.instance.database;
  runApp(

    ModularApp(module: AppModule(), child: AppWidget()
      ));

}
