import 'dart:io';

void main() {
  print('Enter your favorite car:');

  var car = stdin.readLineSync(); //standard input

  print('The car is ${car}');

}