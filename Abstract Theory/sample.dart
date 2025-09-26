enum operation {
  plus,
  minus,
  multiply,
  divide,
}

void main() {

  const a = 4;
  const b = 2;
  const op = operation.minus;
  switch (op) {
    case operation.plus:
      print('$a + $b = ${a + b}');
      break;
    case operation.minus:
      print('$a - $b = ${a - b}');
      break;
    case operation.multiply:
      print('$a * $b = ${a * b}');
      break;
    case operation.divide:
      print('$a / $b = ${a / b}');
      break;
  }

  double tempFarenheit = 90.25;
  double tempCelsius = (tempFarenheit - 32) / 1.8;

  print('${tempFarenheit.toStringAsFixed(1)}F = ${tempCelsius.toStringAsFixed(1)}C');

  //Farenheit to Celsius: (F - 32) / 1.8 = C
  // Desired output
  //86F -
}
