import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/CalculatorLogic.dart';

class CalculatorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculatorState();
  }

}

class CalculatorState extends State<CalculatorScreen>{
  TextEditingController number1InputController = new TextEditingController();
  TextEditingController number2InputController = new TextEditingController();
  String computedanswer = "";
  CalculatorLogic calculatorLogic = new CalculatorLogic();
  double number1 = 0.0;
  double number2 = 0.0;
  double total = 0.0;
  String operation = "";


  void calculate(){
    setState(() {
      //total = double.parse(number1InputController.text) + double.parse(number2InputController.text);
      switch(operation){
        case "Add":{
          total = calculatorLogic.add(double.parse(number1InputController.text), double.parse(number2InputController.text));
        }
        break;
        case "Subtract":{
          total = calculatorLogic.subtract(double.parse(number1InputController.text), double.parse(number2InputController.text));
        }
        break;
        case "Multiply":{
          total = calculatorLogic.multiply(double.parse(number1InputController.text), double.parse(number2InputController.text));
        }
        break;
        case "Divide":{
          total = calculatorLogic.divide(double.parse(number1InputController.text), double.parse(number2InputController.text));
        }
        break;
        default:{
          total = calculatorLogic.power(double.parse(number1InputController.text), double.parse(number2InputController.text));
        }
        break;
      }

      computedanswer = total.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: Column(
        children: <Widget>[
          Text('Kindly Enter Number 1'),
          TextField(
            controller: number1InputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Enter Number 1'
            ),
          ),
          Text('Kindly Enter Number 2'),
          TextField(
            controller: number2InputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Enter Number 2'
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [
              RaisedButton(
                  child: Text('Add'),
                  onPressed:(){
                    operation = "Add";
                    calculate();
                  }),
              RaisedButton(
                  child: Text('Subtract'),
                  onPressed:(){
                    operation = "Subtract";
                    calculate();
                  }),
              RaisedButton(
                  child: Text('Multiply'),
                  onPressed:(){
                    operation = "Multiply";
                    calculate();
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  child: Text('Divide'),
                  onPressed:(){
                    operation = "Divide";
                    calculate();
                  }),
              RaisedButton(
                  child: Text('Power'),
                  onPressed:(){
                    calculate();
                  }),
            ],),

          Text('Answer $computedanswer', style: TextStyle(
              fontSize: 40
          ),)
        ],
      ),
    );
  }

}