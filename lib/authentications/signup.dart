import 'dart:async';

import 'package:cycle/authentications/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class signup extends StatelessWidget {
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
  String email="";
  String password="";
  var _formkey=GlobalKey<FormState>();
  bool isLoading=false;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
      child:Column(
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
          SizedBox(height:40),
          Center(
            child:Form(
              key: _formkey,
            child: Column(
              children:<Widget>[
                Icon(
                    Icons.perm_identity_rounded,
                    color:Colors.deepPurpleAccent.shade100,
                    size:62
                ),
                SizedBox(height:05),
                Text(
                  "SIGN UP",
                  style:TextStyle(
                      fontSize: 32,
                      color:Colors.blueGrey,
                      fontWeight:FontWeight.w100
                  ),
                ),
                SizedBox(height:20),
                SizedBox(
                  width:300,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator:(item){
                      return item.contains("@bvrit.ac.in")?null:"Enter valid email";    //changes needed
                    },
                    decoration: InputDecoration(
                      labelText: "ENTER EMAIL",
                      labelStyle:TextStyle(
                        color:Colors.black,
                      ),
                      suffixIcon: Icon(Icons.email_outlined,color:Colors.deepPurpleAccent.shade100),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Enter your email id",
                    ),
    onChanged: (val) {
      setState(() {
        email = val.trim();
      });
    }
                  ),
                ),
                SizedBox(height:20),
                SizedBox(
                  width:300,

                  child: TextFormField(
                    obscureText:true,
                      keyboardType: TextInputType.text,
                      validator:(item){
                        return item.length>6?null:"Password must be 6 characters";//changes needed
                      },
                    decoration: InputDecoration(
                      labelText: "ENTER PASSWORD",
                      labelStyle:TextStyle(
                        color:Colors.black,
                      ),
                      suffixIcon: Icon(Icons.lock_open_outlined,color:Colors.deepPurpleAccent.shade100),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Enter your password",
                    ),
                      onChanged: (val) {
                        setState(() {
                          password = val.trim();
                        });
                      }
                  ),


                ),
              /*  SizedBox(height:20),
                SizedBox(
                  width:300,
                  child: TextFormField(
                    obscureText:true,
                    decoration: InputDecoration(
                      labelText: "CONFIRM PASSWORD",
                      labelStyle:TextStyle(
                        color:Colors.black,
                      ),
                      suffixIcon: Icon(Icons.lock_open_outlined,color:Colors.deepPurpleAccent.shade100),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.deepPurpleAccent.shade100),
                      ),
                      hintText: "Enter your password",
                    ),
                  ),
                ),*/
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
                     // onPressed: () {
                       // print('You have loggedin sucessfully');

                      //},
                      onPressed: () {
                        if(_formkey.currentState.validate()){//changes required
                          setState(() {
                            isLoading=true;
                          });
                          auth.createUserWithEmailAndPassword(email: email, password: password).then((user) {
                            setState(() {
                              isLoading=false;
                            });
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Verify()), (route) => false);
                          }).catchError((onError){
                            setState(() {
                              isLoading=false;
                            });
                          });
                        }
                      },
                      child: Text(''
                          'SIGN UP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:50),
              SingleChildScrollView(
             child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Already have an account?",
                    style:TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color:Colors.black
                    ),
                  ),
                //  SizedBox(width:2.0),
                  TextButton(onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>signin()));
                  },
                    child:
                    Text("SIGN IN",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration:TextDecoration.underline,
                        color:Colors.black,
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
              )

            ]

          )


          )




    ),
    ]
    )
    )
    );
  }
}
class Verify extends StatefulWidget {
  const Verify({Key key}) : super(key: key);//? changed

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer; //changed late

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    user = auth.currentUser; //!changed
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verification screen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_outlined), onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => signin()));
          },

          )

        ],),
      body: Center(
        child:
        Text("An email has been sent to ${user.email} please verify"),
      ),
    );
  }

  void checkEmailVerified() async {
    user = auth.currentUser; //!changed
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
    }
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

