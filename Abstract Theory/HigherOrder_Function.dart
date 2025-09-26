int inc(int x) => ++x;

int dec(int x) => --x;

int apply(int x, Function f) {
  return f(x);
}

void main() {
  int r1 = apply(3, inc);
  int r2 = apply(2, dec);
  print(r1);
  print(r2);
}