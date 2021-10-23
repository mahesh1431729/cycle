import 'package:cycle/pages/qrcode.dart';
import 'package:cycle/pages/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'help.dart';

class Cardl extends StatefulWidget {
  const Cardl({Key key}) : super(key: key);

  @override
  _CardlState createState() => _CardlState();
}
class _CardlState extends State<Cardl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ECYCLE",style:TextStyle(color:Colors.white)),flexibleSpace:Container(decoration:BoxDecoration(gradient:LinearGradient(begin: Alignment.topLeft,colors:[
        Colors.lightBlueAccent,
        Colors.deepPurpleAccent.shade100
        // Colors.purple,
      ]),),),),
      drawer:Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children:<Widget> [
            DrawerHeader(
                decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent.shade100
                ),
                child: Column(
                  children:<Widget> [
                    CircleAvatar(
                      backgroundColor:Colors.deepPurpleAccent.shade100,
                      radius:10,
                      child: Icon(Icons.person,size:48,color:Colors.black),),
                    SizedBox(height:40),
                    Text("   PROFILE",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                  ],
                )

            ),
            ListTile(
              leading: Icon(Icons.perm_identity_rounded),
              title:Text("Profile"),
              onTap: (){
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:Text("Settings"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title:Text("Wallet"),
              onTap: (){
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title:Text("Sign Out"),
              onTap: (){
                // auth.signOut();
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
              },
            ),

          ],
        ),
      ),
      body:Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: GridView(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
                children:<Widget>[
                  Card(
                    color:Colors.deepPurpleAccent.shade100,
                    elevation:10,
                    semanticContainer: true,
                    clipBehavior:Clip.antiAliasWithSaveLayer,
                    shape:RoundedRectangleBorder(side:BorderSide(color:Colors.grey,width:1),
                        borderRadius:BorderRadius.circular(5) ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height:40),
                          Icon(Icons.electric_bike,size: 60,),
                          SizedBox(height:15),
                          TextButton(child:Text("Take A Ride",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.black)),
                            onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>qrcode()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color:Colors.deepPurpleAccent.shade100,
                    elevation:10,
                    semanticContainer: true,
                    clipBehavior:Clip.antiAliasWithSaveLayer,
                    shape:RoundedRectangleBorder(side:BorderSide(color:Colors.grey,width:1),
                        borderRadius:BorderRadius.circular(5) ),
                    child:Column(
                      children: [
                        SizedBox(height:40),
                        Center(child: Icon(Icons.person_add_alt_1_outlined,size:60)),
                        SizedBox(height:15),
                        Center(
                          child: TextButton(child:Text("Registration",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.black)),
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Feeds()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color:Colors.deepPurpleAccent.shade100,
                    elevation:10,
                    semanticContainer: true,
                    clipBehavior:Clip.antiAliasWithSaveLayer,
                    shape:RoundedRectangleBorder(side:BorderSide(color:Colors.grey,width:1),
                        borderRadius:BorderRadius.circular(5) ),
                    child:Column(
                      children: [
                        SizedBox(height:40),
                        Center(child: Icon(Icons.account_balance_wallet_outlined,size:60)),
                        SizedBox(height:15),
                        Center(
                          child: TextButton(child:Text("Wallet",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.black)),
                            onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>wallet()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color:Colors.deepPurpleAccent.shade100,
                    elevation:10,
                    semanticContainer: true,
                    clipBehavior:Clip.antiAliasWithSaveLayer,
                    shape:RoundedRectangleBorder(side:BorderSide(color:Colors.grey,width:1),
                        borderRadius:BorderRadius.circular(5) ),
                    child:Column(
                      children: [
                        SizedBox(height:40),
                        Center(child: Icon(Icons.help_outline_rounded,size:60),),
                        SizedBox(height:15),
                        Center(
                          child: TextButton(child:Text("Need Help?",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.black)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>help()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),

        ),
      ),
    );
  }
}