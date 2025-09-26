void main() {
  test_param(123);
  print('---');
  test_param(123, s1: 'hello');
  print('---');
  test_param(123, s2: 'hello', s1: 'world');
  print('---');


}

test_param(n1, {s1, s2}) {
  print(n1);
  print(s1);
}