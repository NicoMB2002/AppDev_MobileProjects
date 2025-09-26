class Laptop {
  Laptop({var name, var color}) {
    print('Laptop constructor');
    print('Name: $name');
    print('Color: $color');
  }
}

class MacBook extends Laptop {
  MacBook({var name, var color}) : super(name: name, color: color) {
    print('MacBook constructor');
  }
}

void main() {
  var macBook = MacBook(name: "MacBook Pro", color: "Silver");
}