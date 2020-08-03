import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayStudentInformation extends StatelessWidget{
  final name;
  final email;
  final rollNumber;


  DisplayStudentInformation({this.name, this.email, this.rollNumber});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Display Student Information'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Student name $name',
              style: TextStyle(
                fontSize: 25,
              ),),
            Text('Student Email $email',style: TextStyle(
              fontSize: 25,
            )),
            Text('Student Roll number $rollNumber',style: TextStyle(
              fontSize: 25,
            )),
          ],
        )
        ,),
    );
  }

}