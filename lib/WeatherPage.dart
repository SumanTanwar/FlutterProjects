
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

final apiKey = "f64bf0682e08dc140031412b5a1c04ff";

class WeatherPage extends StatefulWidget {

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  List<String> cities = [
    "Montreal","Toronto","Winnipeg","Ottawa","Goa","Delhi","Palwal","Gurgaon",
  ];
  String weather = "";
  String selectedCity = "";

  Future<void> fetchWeather(String cityName) async {

    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
   // one more time explanation
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      double temp = data["main"]["temp"]; // Question????????????
      int tempInt = temp.toInt();

      setState(() {
        weather = "$tempInt °C";
        selectedCity = cityName;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Check"),
        centerTitle: true,
        actions: [
  PopupMenuButton(
      onSelected: (String city){
        fetchWeather(city);
      },
      itemBuilder: (BuildContext context) {
        return cities.map<PopupMenuItem<String>>((String city) {
          return PopupMenuItem(
              value: city,
              child: Text(city)
          );
        }).toList();
      },
    icon: Icon(Icons.more_vert),
  
  )
        ],
      ),
      body:  Center(
        child: selectedCity.isEmpty ? Text("Select a city") : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Weather of $selectedCity"),
            Text(weather)
          ],
        ),
      )
    );
  }
}
