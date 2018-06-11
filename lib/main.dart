import 'package:flutter/material.dart';
import './ui/splash.dart';
import './ui/landing.dart';
import './ui/intro_page_view.dart';
import './ui/test.dart';

void main() {
  runApp(new MaterialApp(
    title: 'JULO',
    home: Test(),
    theme: new ThemeData(fontFamily: 'Montserrat'),
    routes: <String, WidgetBuilder>{
      '/landing': (BuildContext context) => new Landing()
    },
  ));
}