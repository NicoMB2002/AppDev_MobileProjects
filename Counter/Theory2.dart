/*

Enhanced for loop:

for (var i in list1) {
  print i;
 }

 */

void main() {

  var list = ["James", "Patrick", "Michael", "Emily"];

  print("Example of anonymous function");

  list.forEach((item) {
    print('${list.indexOf(item)} : $item');
  });


  print('Fibonacci 1:');
  var num = 5;
  //Storing the function
  var fact = factorial(num);

  print('Factorial is $fact');


  print('\nHi this is fibonacci number 2: \n');
  int firstNum = 0;
  int secondNum = 1;
  int thirdNum = 0;
  print(firstNum);
  print(secondNum);

  for (int i = 0; i <= 10; i++) {
    thirdNum = firstNum + secondNum;
    print(thirdNum);
    firstNum = secondNum;
    secondNum = thirdNum;
  }

}
//Recursion: (fibonacci)

int factorial(int num) {
  if (num <= 1) { //base case of recursion
    return 1;
  } else {
    return num * factorial(num - 1); // function calls itself
  }
}