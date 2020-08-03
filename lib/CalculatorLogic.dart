import 'dart:math';

class CalculatorLogic {
  double add( double num1 , double num2){
    return (num1+ num2);
  }

  double subtract( double num1 , double num2){
    return (num1 - num2);
  }

  double multiply( double num1 , double num2){
    return (num1 * num2);
  }

  double divide( double num1 , double num2){
    return (num1 / num2);
  }

  double power( double num1 , double num2){
    double answer = pow(num1, num2);
    return answer;
  }
}