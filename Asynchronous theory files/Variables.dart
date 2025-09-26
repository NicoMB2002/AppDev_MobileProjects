void main() {

  //'dynamic' can change variables and values
  dynamic v = 'hal';
  v = 123;
  print(v);

  //var can change values but not variables
  var v2 = 'hal';
  // v2 = 123;
  print(v2);

  //final can't change value nor variable
  final v3 = 7;
  // v3 = 8;
  // v3 = 'hal';
  print(v3);

}