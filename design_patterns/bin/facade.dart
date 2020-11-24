import 'run.dart';
// 创建一个接口。

abstract class Shape {
  void draw();
}

// 创建实现接口的实体类。
class Rectangle implements Shape {
  @override
  void draw() {
    print("Rectangle::draw()");
  }
}

class Square implements Shape {
  @override
  void draw() {
    print("Square::draw()");
  }
}

class Circle implements Shape {
  @override
  void draw() {
    print("Circle::draw()");
  }
}

// 创建一个外观类。
class ShapeMaker {
  Shape circle;
  Shape rectangle;
  Shape square;

  ShapeMaker() {
    circle = new Circle();
    rectangle = new Rectangle();
    square = new Square();
  }

  void drawCircle() {
    circle.draw();
  }

  void drawRectangle() {
    rectangle.draw();
  }

  void drawSquare() {
    square.draw();
  }
}

class RunFacade implements Run {
  @override
  void main() {
    ShapeMaker shapeMaker = new ShapeMaker();
    shapeMaker.drawCircle();
    shapeMaker.drawRectangle();
    shapeMaker.drawSquare();
  }

  @override
  String name = "外观模式";
}
