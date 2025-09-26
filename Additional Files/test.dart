import 'dart:io';

void main() {
  var name = 'Nicolas';
  var roll_no = 24;
  // var emoji = '\u2665'; //heart
  var emoji = '\uF601';
  print("My name is ${name}. My roll number is ${roll_no}. ${emoji}.");


  print("Example of Assignment Operators: ");
  var n1 = 10;
  var n2 = 5;

  print("n1 + n2 = ${n1 + n2}");
  print("n1 - n2 = ${n1 - n2}");
  print("n1 * n2 = ${n1 * n2}");
  print("n1 / n2 = ${n1 / n2}");
  print("n1 % n2 = ${n1 % n2}");

  print("Example of :");
  var number = 10;
  // var name = 'Nicolas';

  print(number is int);//true
  print(name is int);//false

  print(number is String);//false
  print(name is String);//true

  print("Example of :");

  int num = 321;
  int reversedNum = 0;
  int remainder = 0;

  while ( num > 0) {
    remainder = num % 10;
    reversedNum = reversedNum * 10 + remainder;
    num = num ~/ 10; //tilde '~' to remove the decimals
  }
  print("The reversed number is ${reversedNum}.");

  print("Example of Pyramids:");

  for(int i = 0; i < 4; i++) {
    var line = "";
    for(int j = 0; j < i; j++) {
      line += "M";
    }
    print(line);
  }

  for(int i = 0; i <= 3; i++) {
    for(int j = 0; j < i; j++) {
      stdout.write('1 '); //standard output
    }
    print(" ");
  }
  int k = 1;
  for(int i = 0; i <= 3; i++) {
    for(int j = 0; j < i; j++) {
      stdout.write(k++); //standard output
    }
    print(" ");
  }

  print("Example of List:");
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  List<String> fruits = ['Apple', 'Banana'];

  //Adding a single element
  fruits.add('Orange');

  //Adding multiple elements
  fruits.addAll(['Mango', 'Grapes']);

  print(fruits); // output: [Apple, Banana, Orange, Mango, Grapes]

  print('Example of set:');

  print('Initializing set...');

  // var names = <String>["James"]
}