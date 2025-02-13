import 'package:first_proj/PaymentMethodScreen.dart';
import 'package:first_proj/WeatherPage.dart';
import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Padding(
          padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Spacer(),
              CircleAvatar(
                child:  Image.asset("assets/check.png",width: 70,height: 70,fit: BoxFit.contain,),
                backgroundColor: Colors.green.withOpacity(0.2),
                radius: 70,
              ),
              SizedBox(height: 30,),
              Text("Order Confirmation",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text("Your order is confirmed!"
                  " Processing Now, Shipping Details will follow soon..",
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 16) ),

              Spacer(),

              ElevatedButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Weatherpage()));
              },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50)
                ),
                child: Text("Weather Check",style: TextStyle(color: Colors.white)),)
            ],),

        ) ,
      )
    );
  }
}
