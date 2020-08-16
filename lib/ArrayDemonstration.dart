import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrayDemonstration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: prepareArrayData(context),
    );
  }

}

Widget prepareArrayData(context){
  final names = ['Jithin','Garvit','Pranjal','Kaushik & Kartik'];
  final icons = [Icons.camera, Icons.favorite, Icons.timer, Icons.accessibility_new];
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  return ListView.builder(
      itemCount:  europeanCountries.length,
      itemBuilder: (context, index){
          return ListTile(
            //leading: Icon(icons[index]) ,
            title: Text(europeanCountries[index]),
          );
      },
  );
}