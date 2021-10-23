 import 'package:cycle/pages/rideconformed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class details extends StatelessWidget {

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
Icon(
Icons.directions_bike,
color:Colors.black,
size:80,
),
SizedBox(height:60),
Text(
"Vehicle No.                    23",
textAlign: TextAlign.left,
style:TextStyle(
fontSize: 24,
color:Colors.black,
//fontWeight:FontWeight.w100
),
),
SizedBox(height:10),
Text(
"Distance                  2.5Km",
textAlign: TextAlign.center,
style:TextStyle(
fontSize: 24,
color:Colors.black,
//fontWeight:FontWeight.w100
),
),
SizedBox(height:10),
Text(
"Estimated Time        5min",
textAlign: TextAlign.center,
style:TextStyle(
fontSize: 24,
color:Colors.black,
//fontWeight:FontWeight.w100
),
),
SizedBox(height:10),
Text(
"Payment Mode      PayTm",
textAlign: TextAlign.center,
style:TextStyle(
fontSize: 24,
color:Colors.black,

//fontWeight:FontWeight.w100
),
),
SizedBox(width: 100,height:50),
ElevatedButton(
child: Text(
"Confirm Booking".toUpperCase(),
style: TextStyle(fontSize: 14)
),
style: ButtonStyle(
foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
shape: MaterialStateProperty.all<RoundedRectangleBorder>(
RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
side: BorderSide(color: Colors.blueGrey)
)
)
),
onPressed: () => Navigator.push(context,MaterialPageRoute(builder:(context)=>ride()))
)
]
)


),

),
],
),
),
)
);
}
}
