import 'package:flutter/material.dart';

class Weatherpage extends StatefulWidget {
  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  List<String> cities = [
    "Montreal",
    "Toronto",
    "Winnipeg",
    "Saskatchewan",
    "Delhi",
    "Ottawa",
    "Gurgaon",
    "Palwal",
    "Faridabad"
  ];

  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          PopupMenuButton(
            onSelected: (String city) {
              setState(() {
                cityName = city;
              });
            },
            itemBuilder: (BuildContext context) {
              return cities.map<PopupMenuItem<String>>((String city) {
                return PopupMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Text(
          cityName.isEmpty ? 'Select a city' : cityName,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
