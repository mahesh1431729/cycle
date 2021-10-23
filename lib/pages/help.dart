import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyPainter (),
    );
  }
}
class MyPainter  extends StatefulWidget{
  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height:80,
                width:210,
                child:CustomPaint(
                  painter:ShapePainter(),
                ),),
            ],
          ),
          SizedBox(height:10),
          Center(
            child: Column(
              children:<Widget>[
                Icon(
                    Icons.help,
                    color:Colors.deepPurpleAccent.shade100,
                    size:62
                ),
                SizedBox(height:05),
                Text(
                  "HELP",
                  style:TextStyle(
                      fontSize: 32,
                      color:Colors.blueGrey,
                      fontWeight:FontWeight.w100
                  ),
                ),
                SizedBox(height:15),
                SizedBox(
                  width:300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle:TextStyle(
                        color:Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Enter your name",
                    ),
                  ),
                ),
                SizedBox(height:15),
                SizedBox(
                  width:300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:TextStyle(
                        color:Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Enter your email",
                    ),
                  ),
                ),
                SizedBox(height:15),
                SizedBox(
                  width:300,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "How can we help?",
                      labelStyle:TextStyle(
                        //  height: 5,
                        color:Colors.black,
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Ask Us!",
                    ),
                  ),
                ),

                SizedBox(height:70),
                ButtonTheme(
                  height: 40,
                  disabledColor: Colors.deepPurpleAccent.shade100,
                  child: SizedBox(
                    width: 130,
                    child: RaisedButton(
                      disabledElevation: 4.0,
                      color: Colors.deepPurpleAccent.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      onPressed: () {
                        print('You have loggedin sucessfully');
                      },
                      child: Text(''
                          'SUBMIT',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

              ],),
          ),
        ],),

    );
  }
}
