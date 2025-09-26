void main() {
  Student emp1 = new Student();
  Student emp2 = new Student.namedConst('ST001');
}

class Student {
  Student() {
    print('print inside student constructor');
  }

  Student.namedConst(String stCode) {
    print(stCode);
  }
}