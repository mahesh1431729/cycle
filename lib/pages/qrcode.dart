import 'package:cycle/pages/vehicledetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class qrcode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Splash Screen Example")),



           body: Column(
              children: [
                ButtonTheme(
                height: 40,
                disabledColor: Colors.teal,
                child: SizedBox(
                  width: 130,
                  child: RaisedButton(
                    disabledElevation: 4.0,
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>details()));
                    },
                    child: Text(''
                        'QR SCANNER',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
          ),
              ],
            ),



    );
  }
}