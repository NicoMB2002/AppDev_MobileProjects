/*
3. Write a Dart program that uses a lambda expression to find and display
simple calculator of two numbers entered by the user.
 */

import 'dart:io';

void main() {

  print('Enter first value:');
  String? value1 = stdin.readLineSync();

  print('Enter second value:');
  String? value2 = stdin.readLineSync();

  if (value1 != null && value2 != null) {
    try {
      double num1 = double.parse(value1);
      double num2 = double.parse(value2);

      var add = (double a, double b) => a + b;
      var subtract = (double a, double b) => a - b;
      var multiply = (double a, double b) => a * b;
      var divide = (double a, double b) => a / b ;

      print('Addition: ${add(num1, num2)}');
      print('Subtraction: ${subtract(num1, num2)}');
      print('Multiplication: ${multiply(num1, num2)}');
      print('Division: ${divide(num1, num2).toStringAsFixed(2)}');
    } catch (e) {
      print('Invalid input. Please enter a valid value.');
    }
  }
}
