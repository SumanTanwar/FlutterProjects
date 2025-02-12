
import 'package:flutter/material.dart';
import 'Confirmation.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedMethod = "";
  TextEditingController name = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController cardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: CircleAvatar(
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back, color: Colors.black,)
          ),
          backgroundColor: Colors.white,
        ),
        title: Text("Payment Method",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
        CircleAvatar(child:   IconButton(onPressed: (){},
            icon: Icon(Icons.more_horiz)
        ),
          backgroundColor: Colors.white,
        )
        ],
      ) ,
      body: SingleChildScrollView(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Method", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _paymentOption("assets/plus.png",true),
                 _paymentOption("assets/card.png",false),
                 _paymentOption("assets/visa.png",true),
                _paymentOption("assets/paypal.png",true),
                _paymentOption("assets/apple.png",true),
                //_paymentOption(Icon(Icons.apple, size: 40, color: Colors.black)),
              ],
            ),
            SizedBox(height: 20),
           Text("Master Card", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
           ),
            SizedBox(height: 15),
            Image.asset('assets/masterCard.jpeg',
              width: double.infinity,
              height: 200,fit: BoxFit.fitWidth,),
            SizedBox(height: 20),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Cardholder Name"),
                 SizedBox(height: 10,),
                 inputField(name, false),
               ],
             ),),
             SizedBox(width: 10,),
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("CVV"),
                 SizedBox(height: 10,),
                 inputField( cvv, false),
               ],
             ),),

           ],
           ),
       SizedBox(height: 10,),
       Row(children: [
         Expanded(child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Card Number"),
             SizedBox(height: 10,),
             inputField(cardNumber, true),
           ],
         ),),
       ],),
           SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Confirmation()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize:  Size(double.infinity, 50),
              ),
              child: const Text("Save",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption( String IconPath, bool bgColor) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: bgColor ? Colors.white : Colors.black,
        radius: 30,
        child: Image.asset(IconPath,width: 40,height: 40,),
      ),
    );
  }
}

Widget inputField( TextEditingController controller, bool isIcon){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      suffixIcon: isIcon ? Icon(Icons.credit_card) : null,
    ),

  );
}

