//You can create a list by specifying the initial elements in a square bracket.

void main() {
//Integer list
  List<int> ages = [10, 30, 23];

//String list
  List<String> names = ["Raj", "Michael", "Susan"];

//Fixed Length list
  var list = List<int>.filled(5, 0);

  print(list);

  // '...' => Spread operator: helps you combine lists

  List list1 = ['Mango', 'Grapes'];
  List list2 = ["Banana", "Apple"];

  var combinedList = [...list1, ...list2];

  //printing combined list
  print(combinedList);


  //Conditions in list:

  bool sad = false;
  var cart = ['milk', 'ghee', if(sad) 'Beer'];
  print(cart);

  // 'where' in dart

  List<int> numbers = [2, 4, 6, 8, 10];

  List<int> even = numbers.where((number) => number.isEven).toList();
  print(even);
}