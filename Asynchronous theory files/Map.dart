void main() {
  //creating a Map
  Map<String, int> ageMap = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 22,
  };

  //Ascending values in the Map
  int? aliceAge = ageMap['Alice']; //int? can hold either an integer value or the null value

  //Adding a new key-value pair to the Map
  ageMap['David'] = 28;

  //Removing a key-value pair from the Map
  ageMap.remove('Charlie');

  //Iterating over the Map
  ageMap.forEach((key, value) {
    print('$key is $value years old.');
  });
}