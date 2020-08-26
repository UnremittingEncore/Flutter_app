import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/CalculatorScreen.dart';
import 'package:calculator_app/CameraScreen.dart';
import 'package:calculator_app/InputInformationScreen.dart';
import 'package:calculator_app/SecondScreen.dart';
import 'package:calculator_app/UserInformation.dart';
import 'package:calculator_app/PageViewDemonstration.dart';
//import 'package:calculator_app/RestApiDemonstration.dart';
void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to flutter'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello Everyone'),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to navigate to Second Screen'),
              onPressed:(){
                navigateToSecondScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Calculator Screen'),
              onPressed:(){
                navigateToCalculatorScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Enter Information Screen'),
              onPressed:(){
                navigateToInputInformationScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Sqlite Demonstration'),
              onPressed:(){
                navigateToSqliteScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Camera Demonstration'),
              onPressed:(){
                navigateToCameraScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Pageview Demonstration'),
              onPressed:(){
                navigateToPageViewDemonstrationScreen(context);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Click to See Rest API Demonstration'),
              onPressed:(){
               // navigateToRestApiDemonstrationScreen(context);
              },
            ),
          ],
        ),
      ),
    );

  }

  void navigateToSecondScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen() ,));
  }

  void navigateToCalculatorScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen() ,));
  }

  void navigateToInputInformationScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => InputInformationScreen(),));
  }

  void navigateToSqliteScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => UserInformation(),));
  }

  void navigateToCameraScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(),));
  }

  void navigateToPageViewDemonstrationScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewDemonstration(),));
  }
/*
  void navigateToRestApiDemonstrationScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => RestApiDemonstration(),));
  }
*/

}

