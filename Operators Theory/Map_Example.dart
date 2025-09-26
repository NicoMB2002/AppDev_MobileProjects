// Map: collection of key value pairs

import 'dart:collection';

void main() {
  HashMap map = new HashMap<int, String>();
  LinkedHashMap map2 = new LinkedHashMap<int, String>();
  SplayTreeMap map3 = new SplayTreeMap<int, String>();

  map[0] = 'Montreal';
  map[1] = 'New York';
  map[2] = 'Cuenca';
  map2[0] = '1';
  map2[1] = '2';
  map2[2] = '3';
  map3[0] = 'Orange';
  map3[1] = 'Red';
  map3[2] = 'Blue';

  print(map);
  print(map2);
  print(map3);

  //to add an entry only if the entry with the key doesnt exist in the map:
  //putIfAbsent

  map.putIfAbsent(1,() => 'Madrid'); // since this is not absent, it doesnt put it
  map.putIfAbsent(3,() => 'Madrid'); // there is no element inside index 3

  print(map);
  //To update the value if the key already exists use:
  //update()

  map2.update(1, (e) => 'A');
  print(map2);
}