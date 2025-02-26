import 'package:first_proj/WeatherPage.dart';
import 'package:first_proj/layout.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey
        ),
            scaffoldBackgroundColor: Colors.blueGrey
      ),
      home: CheckoutPage(),
    );
  }
}

