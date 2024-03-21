import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/utilies/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(

    MaterialApp(
      theme: ThemeData(fontFamily: "tilana"),
      debugShowCheckedModeBanner: false,
      routes: app,
    ),
  );
}
