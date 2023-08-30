import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import "dart:developer";
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    log("run app");
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var client = http.Client();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Speed Dial Floating Action Menu"),
             backgroundColor: Colors.deepOrangeAccent,
          ),
          body: IconButton(icon: Icon(Icons.volume_down),
          onPressed: () async {
            var response = await client.post(Uri.parse("https://demo-tsb-web.onlineasset.co.th/api/client/auth/login"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'email': "mizterbasoo@gmail.com",
                'password': "As123456-"
              }));
            var result = jsonDecode(response.body);
            print(result);
          },),
          floatingActionButton: SpeedDial(
            icon: Icons.menu, //icon on Floating action button
            activeIcon: Icons.close, //icon when menu is expanded on button
            backgroundColor: Colors.deepOrangeAccent, //background color of button
            foregroundColor: Colors.white, //font color, icon color in button
            activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
            activeForegroundColor: Colors.white,
            buttonSize: Size(56.0, 56.0), //button size
            visible: true,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'), // action when menu opens
            onClose: () => print('DIAL CLOSED'), //action when menu closes

            elevation: 8.0, //shadow elevation of button
            shape: CircleBorder(), //shape of button

            children: [
              SpeedDialChild( //speed dial child
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                label: 'First Menu Child',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => {
                  
                },
                onLongPress: () => print('FIRST CHILD LONG PRESS'),
              ),
              SpeedDialChild(
                child: Icon(Icons.brush),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                label: 'Second Menu Child',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('SECOND CHILD'),
                onLongPress: () => print('SECOND CHILD LONG PRESS'),
              ),

              SpeedDialChild(
                child: Icon(Icons.keyboard_voice),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                label: 'Third Menu Child',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('THIRD CHILD'),
                onLongPress: () => print('THIRD CHILD LONG PRESS'),
              ),

              //add more menu item children here
            ],
          ),

       );
  }
}