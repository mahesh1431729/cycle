import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wallet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 400.0,
                width: 310.0,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(146, 223, 223, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      SizedBox(height:10),
                      Text(
                        "Available Balance",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.black,
                          //fontWeight:FontWeight.w100
                        ),
                      ),

                      SizedBox(height:20),
                      Text(
                        "500/-",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 24,
                          color:Colors.black,
                          //fontWeight:FontWeight.w100
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}