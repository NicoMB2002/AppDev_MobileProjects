/*
5. Create a list of numbers, perform various operations on it, and demonstrate
some common list methods. Now, create a list of Strings, and try to apply
same operations that you applied on numbers.
 */

void main() {

  print('==============Numbers List==================\n');
  List<int> numberList = [81, 3, 55, 23, 20, 44];

  print('Original: $numberList');
  numberList.add(60);
  numberList.remove(20);
  print('After add/remove: $numberList');
  print(numberList.contains(1));
  numberList.sort();
  print('After sort: $numberList');

  print('\n==============Strings List==================\n');

  List<String> stringList = ["Nicolas", "Esmeralda", "Mathew", "Steph", "Luke", "Emily"];
  print('Original: $stringList');
  stringList.add('Mike');
  stringList.remove('nicolas');
  print('After add/remove: $stringList');
  stringList.forEach((name) {
    if(name.startsWith('E')) {
      print('Name that starts with \'E\': $name');
    }
  });
  print(stringList.contains('Mathew'));
  stringList.sort();
  print('After sort: $stringList');



}
