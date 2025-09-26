void main() {

  test_param(123);

  print(pow(2, 2));
  print(pow(2, 4));
  print(pow(3));
}

void test_param(n1, [s1]) {
  print(n1);
  print(s1);
}


int pow(int x, [int y = 2]) {
  int r = 1;

  for (int i = 0; i < y; i++) {
    r *= x;
  }
  return r;
}