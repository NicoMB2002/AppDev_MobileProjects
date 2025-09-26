import 'package:flutter/material.dart';

abstract class Shape {
  void area();
}

class Circle extends Shape{
  int radius;

  Circle(this.radius);

  void area() {
    print(3.14 * (radius * radius));
  }
}

class Square extends Shape{

  int side;

  Square(this.side);

  void area() {
    print(side * side);
  }
}

void main() {

  Circle circle = new Circle(7);

  circle.area();

}



