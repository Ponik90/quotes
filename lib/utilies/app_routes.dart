import 'package:flutter/cupertino.dart';
import 'package:quotes/screen/edit/edit_screen.dart';
import 'package:quotes/screen/home/home_screen.dart';

Map<String,WidgetBuilder> app = {

  '/':(context) => const HomeScreen(),
  'edit':(context) => const EditScreen(),
};