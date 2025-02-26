import 'dart:convert';

import 'package:first_proj/Utility/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

final apiKey = "f64bf0682e08dc140031412b5a1c04ff";

class WeatherPage extends StatefulWidget {

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  String selectedCity = "";
  List<String> cities = ["Montreal", "Ottawa", "Winnipeg", "Toronto","Surrey","Palwal"];
  String date = "";
  String date1 = "";
  String weatherStatus = "";
  String temp = "";
  String feelsLike = "";
  String maxTemp = "";
  String minTemp = "";
  String windSpeed = "";
  String humidity = "";
  String Visibility = "";

  bool isLoading = false;


  Future<void> fetchWeather(String cityName) async{

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
    final response = await get(url);

    if(response.statusCode == 200) {

      final data = jsonDecode(response.body);

      double tempdbl = data["main"]["temp"];
      int tempInt = tempdbl.toInt();
      double feelslike = data["main"]["feels_like"];
      int feelslikeInt = feelslike.toInt();

      String weatherstatus = data["weather"][0]["description"];

      double maxtemp = data["main"]["temp_max"];
      int maxtempInt = maxtemp.toInt();
      double mintemp = data["main"]["temp_min"];
      int mintempInt = mintemp.toInt();

      double windspeed = data["wind"]["speed"];
      int windspeedInt = windspeed.toInt();

      int humidit = data["main"]["humidity"];

      int visibility = data["visibility"];
      double visiblityKM = visibility / 1000;
      int visibilityKMINt = visiblityKM.toInt();

      String formatedDate = DateFormat("EEEE d MMMM").format(DateTime.now());
      String formateeDate1 = DateFormat("d MMM").format(DateTime.now());

      setState(() {
        date = formatedDate;
        date1 = formateeDate1;
        temp = "$tempInt°";
        weatherStatus = weatherstatus;
        feelsLike = "$feelslikeInt";
        maxTemp = "$maxtempInt";
        minTemp = "$mintempInt";
        windSpeed = "$windspeedInt";
        humidity = "$humidit";
        Visibility = "$visibilityKMINt";
      });

      Future.delayed(Duration(seconds: 1),(){
        setState(() {
          isLoading = false;
        });
      });

    } else
    {
      print("Something not gone properly.");
    }
  }

  String getWeatherdescription (String weatherstatus){
    double tempfeelsLike = double.parse(feelsLike);

    if (tempfeelsLike >= 30){
      return "It feels more hot because $weatherstatus today.";
    }else if(tempfeelsLike < 30 && tempfeelsLike >= 10){
      return "It is quite cooler today because $weatherstatus.";
    } else if(tempfeelsLike < 10 ){
      return "it is cold outside because $weatherstatus today.";
    } else{
      return "its a normal day.";
    }
  }

  Icon getWeaatherIcon(String weatherStatus){
    if(weatherStatus.contains("clear")){
      return Icon(Icons.wb_sunny, size: 50,color: Colors.orange,);
    } else if(weatherStatus.contains("clouds")){
      return Icon(Icons.cloud, size: 50, color: Colors.grey);
    } else if(weatherStatus.contains("rain" ) || weatherStatus.contains("shower")){
      return Icon(Icons.grain, size: 50, color: Colors.blue);
    } else if(weatherStatus.contains("snow")){
      return Icon(Icons.ac_unit, size: 50, color: Colors.blue);
    } else {
      return Icon(Icons.help_outline, size: 50, color: Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCity,style: AppStyle.getTextStyle()),
        centerTitle: true,
        actions: [
          DropdownButton(
            value: selectedCity.isEmpty ? null : selectedCity,
            items: cities.map<DropdownMenuItem<String>>((String city) {
              return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city));
            }).toList(),
            onChanged: (String? city){
              if(city != null){
                setState(() {
                  selectedCity = city;
                });
                fetchWeather(city);
              }
            },
            dropdownColor: Colors.blueGrey,
          )
        ],
      ),

      body: Center(
        child:isLoading
            ? CircularProgressIndicator()
            : selectedCity.isEmpty
            ? Text("Select the city")
            : Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0)
                  ),
                  child: Text(date, style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 5,),
                Text(weatherStatus, style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text("$temp",style: TextStyle(fontSize: 100),),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Daily Summery",style: AppStyle.getTextStyle(),),
                      Text("Now it seems $feelsLike but actually temprature is $temp.",style: TextStyle(fontSize: 16)),
                      Text(getWeatherdescription(weatherStatus),style: TextStyle(fontSize: 16)),
                      Text("The temperture ranges from $minTemp to $maxTemp today.",style: TextStyle(fontSize: 16) )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 5,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.air_rounded,color: Colors.white),
                              Icon(Icons.water_drop,color:Colors.white),
                              Icon(Icons.remove_red_eye_outlined,color: Colors.white,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("$windSpeed km/h",style: TextStyle(color:Colors.white)),
                              Text("$humidity %",style: TextStyle(color:Colors.white)),
                              Text("$Visibility km",style: TextStyle(color:Colors.white)),
                            ],
                          ),),
                        Padding(padding: EdgeInsets.all(10.0),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Wind",style: TextStyle(color:Colors.white)),
                                Text("Humidity",style: TextStyle(color:Colors.white)),
                                Text("visiblity",style: TextStyle(color:Colors.white)),
                              ],
                            ))

                      ],
                    ) ,
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Weekly Forcast",style: AppStyle.getTextStyle(),),
                    Icon(Icons.arrow_right_alt_outlined,size: 40,)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 3
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:  Column(
                            children: [
                              Text(temp),
                              getWeaatherIcon(weatherStatus),
                              Text(date1),
                            ],
                          ),
                        )
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 3
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:  Column(
                            children: [
                              Text(temp),
                              getWeaatherIcon(weatherStatus),
                              Text(date1),
                            ],
                          ),
                        )
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 3
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:  Column(
                            children: [
                              Text(temp),
                              getWeaatherIcon(weatherStatus),
                              Text(date1),
                            ],
                          ),
                        )
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 3
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child:  Column(
                            children: [
                              Text(temp),
                              getWeaatherIcon(weatherStatus),
                              Text(date1),
                            ],
                          ),
                        )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


