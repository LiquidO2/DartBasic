import 'dart:math';

abstract class Shape {
  double calculateArea();
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * pow(radius, 2);
  }
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double calculateArea() {
    return pow(side, 2).toDouble();
  }
}

class AreaCalculator {
  double calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}
