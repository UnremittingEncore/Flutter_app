import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewDemonstration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        child: prepareListViewData(context),
      );
  }
  
}

Widget prepareListViewData(context){
    return ListView(
        children: ListTile.divideTiles(
            context: context,
            tiles:[
              ListTile(
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Sunday'),
                subtitle: Text('Priority High'), //Priority
                onTap: () => GestureTapCallback, // Tap action
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Monday'),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Tuesday'),
              ),
              ListTile(
                leading: Icon(Icons.timer),
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Wednesday'),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Thursday'),
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward) ,
                title: Text('Friday'),
              ),
              ListTile(
                leading: Icon(Icons.timer),
                trailing: Icon(Icons.email) ,
                title: Text('Saturday'),
              ),
            ],
        ).toList(),
    );
}