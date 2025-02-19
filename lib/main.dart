import 'package:first_proj/Confirmation.dart';
import 'package:first_proj/WeatherPage.dart';
import 'package:first_proj/layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

