/* 1. Write a Dart program that takes values from a user and calculate area
circumference of a circle using an anonymous function. */

import 'dart:io';
import 'dart:math';

void main() {
  print('Enter Radius for circle:');

  String? value = stdin.readLineSync();

  if (value != null) {
    try {
      double number = double.parse(value);

      var area = (double radius) {
        return (radius * radius) * pi;
      };

      print('The area is: ' + area(number).toStringAsFixed(2));

    } catch (e) {
      print('Invalid input. Please enter a valid value.');
    }
  }
}
