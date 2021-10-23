import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'authentications/signin.dart';
import 'authentications/signup.dart';


Future <void>main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyPainter()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:LinearGradient(
            colors: [
              Color.fromRGBO(170, 177, 240, 1),
              Color.fromRGBO(185, 252, 228, 1)
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo here
          Image.asset(
            'assets/Logo.png',

          ),
          SizedBox(
            height: 20,
          ),

        ],
      ),

    );
  }
}
/*
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Splash Screen Example")),
      body: Center(
          child:Text("Welcome to Home Page",
              style: TextStyle( color: Colors.black, fontSize: 30)
          )
      ),
    );
  }
}*/
class MyPainter  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Expanded(child:
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
          ),
          SizedBox(height: 70,),
          Text(
            'GET STARTED',
            style: TextStyle(
              fontSize: 30,
              //fontFamily: 'MarkaziText',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 80,),
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
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>signin()));
                },
                child: Text(''
                    'SIGN IN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
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
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>signup()));
                },
                child: Text(''
                    'SIGN UP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:330,
              width:360,
              child:CustomPaint(
                foregroundPainter: LinePainter(),
              ),),

          ],
          )
        ],
      ),
    );

  }
}
class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size) {
    final paint = Paint()
      ..strokeWidth=10
      ..color=Colors.lightBlueAccent;

    canvas.drawLine(
      Offset(size.width*0,size.height*1),
      Offset(size.width*1,size.height*1),
      paint,
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas,Size size){
    var paint=Paint()
      ..color=Colors.tealAccent
      ..strokeWidth=5
      ..strokeCap=StrokeCap.round;
    final path=Path();
    final p=Path();
    final r=Path();
    path.moveTo(size.width*1/2, size.height);
    path.lineTo(0,0);
    path.lineTo(size.width*3/4,0);
    path.close();
    canvas.drawPath(path,paint);
    var y=Paint()
      ..color=Colors.lightBlueAccent
      ..strokeWidth=5
      ..strokeCap=StrokeCap.round;
    r.moveTo(size.width,size.height);
    r.lineTo(size.width*0.7,0);
    r.lineTo(size.width, 0);
    r.close();
    canvas.drawPath(r,y);
    var q=Paint()
      ..color=Colors.deepPurpleAccent.shade100
      ..strokeWidth=5
      ..strokeCap=StrokeCap.round;
    p.moveTo(size.width*3/4, size.height);
    p.lineTo(size.width*0.30, 0);
    p.lineTo(size.width, 0);
    p.close();
    canvas.drawPath(p,q);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
