import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/DisplayStudentInformation.dart';

class InputInformationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EnterInformation();
  }
}

class EnterInformation extends State<InputInformationScreen>{

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController rollnoController = new TextEditingController();
  bool emailError = false;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Enter Student Information'),),
        body: SingleChildScrollView(
          child: Center(
              child: Column(

                children: <Widget>[
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network('https://placeimg.com/640/480/any'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(20),
                  ),
                  Text('Enter Student Name'),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        contentPadding: EdgeInsets.only(left: 20, top: 10, right: 20)
                    ),
                  ),
                  Text('Enter Student Email'),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        errorText: emailError ? 'Invalid Email' :'',
                        contentPadding: EdgeInsets.only(left: 20, top: 10, right: 20)
                    ),
                  ),
                  Text('Enter Student Roll number'),
                  TextField(
                    controller: rollnoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Roll',
                        contentPadding: EdgeInsets.only(left: 20, top: 10, right: 20)
                    ),
                  ),
                  RaisedButton(
                      child: Text('Pass Information'),
                      onPressed: (){
                        gotoDisplayStudentInformationScreen(context);
                      })
                ],
              )
          ),
        )

    );
  }

  gotoDisplayStudentInformationScreen(context){
    String email = emailController.text.toString();
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(!emailValid){
      setState(() {
        emailError = true;
      });
      return;
    }
    if(nameController.text.isEmpty || emailController.text.isEmpty || rollnoController.text.isEmpty){
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayStudentInformation(
        name: nameController.text,
        email: emailController.text,
        rollNumber: rollnoController.text
    ),));
  }

}