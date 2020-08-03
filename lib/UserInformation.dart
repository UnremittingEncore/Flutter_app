import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:calculator_app/DatabaseHelper.dart';

class UserInformation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InputUserInformation();
  }

}

class InputUserInformation extends StatelessWidget{
  String TAG = "InputUserInformation";
  TextEditingController userNameController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  Logger logger = new Logger();
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('User Information'),),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                    hintText: 'Enter User name'
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: userAgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter User Age'
                ),
              ),
            ),

            RaisedButton(
                child: Text('Insert Information'),
                onPressed: (){
                  logger.e(TAG , "Insert information button is clicked");
                insertInformation(userNameController.text, int.parse(userAgeController.text));
            }),
            RaisedButton(
                child: Text('Display Information'),
                onPressed: (){
                  logger.e(TAG , "Display information button is clicked");
                  displayInformation();
                }),

            RaisedButton(
                child: Text('Update Information'),
                onPressed: (){
                  logger.e(TAG , "Update information button is clicked");
                  updateInformation(userNameController.text, int.parse(userAgeController.text));
                }),

            RaisedButton(
                child: Text('Delete Information'),
                onPressed: (){
                  logger.e(TAG , "Delete information button is clicked");
                  deleteInformation();
                }),
          ],
      ),
    );
  }

  void insertInformation(String userName, int age) async{
    logger.d(TAG + " Inside insert information "+ userName + " age "+ age.toString());
    Map<String, dynamic> data = {
      DatabaseHelper.columnname : userName,
      DatabaseHelper.columnAge : age
    };

    final rowid = await dbHelper.insertData(data);
    logger.d(TAG , "Row id "+ rowid.toString());
  }

  void updateInformation(String userName, int age) async{
    logger.d(TAG + " Inside update information "+ userName + " age "+ age.toString());
    Map<String, dynamic> data = {
      DatabaseHelper.columnId : 1,
      DatabaseHelper.columnname : userName,
      DatabaseHelper.columnAge : age
    };

    final updatedrowid = await dbHelper.updateData(data);
    logger.d(TAG , " Updated Row id "+ updatedrowid.toString());
  }

  void deleteInformation() async{
    logger.d(TAG + " Inside delete information ");
    final deletedrowid = await dbHelper.deleteData(2);
    logger.d(TAG , " Updated Row id "+ deletedrowid.toString());
  }


  void displayInformation() async{
    final entireData = await dbHelper.queryEntireTable();
    logger.d(TAG + " Entire data "+ entireData.toString());
  }
}