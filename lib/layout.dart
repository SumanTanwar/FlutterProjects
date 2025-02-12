
import 'package:flutter/material.dart';
import 'PaymentMethodScreen.dart';

class CheckoutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child:  IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
        ),
        title: Text("Checkout", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
         CircleAvatar(
           child:  IconButton(
             icon: Icon(Icons.more_horiz, color: Colors.black),
             onPressed: () {},
           ),
           backgroundColor: Colors.white,
         ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildListTitle(Icons.location_on, "Shipping Address", "NewYork USA",true),
              Divider(color: Colors.white),
              buildListTitle(Icons.payment, "Payment Method", "1234 **** ****", true),
              Divider(color: Colors.white),
              buildListTitle(Icons.local_shipping, "Delivery", "Delivery by Friday, November 8", false),
              Divider(color: Colors.white),
              buildListTitle(Icons.featured_play_list_outlined, "Orders Items", "Items(3)", true),
              Divider(color: Colors.white),
              SizedBox(height: 120),
              
              buildAmountRow("Sub Total", "\$1,229", false),
              buildAmountRow("Shipping", "\$49", false),
              Divider(color: Colors.white),
              buildAmountRow("Total Amount", "\$1,278", true),
              SizedBox(height: 20),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(25),
                    // ),
                    minimumSize: Size(double.infinity, 50)
                  ),
                  child: Text("Place Order", style: TextStyle(color: Colors.white)))
            ],
          ),
      ),
    );

  }
}


Widget buildListTitle(IconData icon, String title, String subTitle, bool isArrow) {
  return ListTile(
    leading: CircleAvatar(child: Icon(icon, color: Colors.black),backgroundColor: Colors.white,),
    title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(subTitle),
    trailing: isArrow ? Icon(Icons.arrow_forward, size: 18) : null,
  );
}

Widget buildAmountRow(String label, String amount, bool isBold ){
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label,style:TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      Text(amount,style: TextStyle(fontSize:16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal ))
    ],
  ),
  );
}
