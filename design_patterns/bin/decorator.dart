import 'run.dart';

//创建接口
abstract class Shape {
  void draw();
}

//创建接口实体类
class Rectangle implements Shape {
  @override
  void draw() {
    print("shape: Rectangle");
  }
}
class Circle implements Shape {
  @override
  void draw() {
    print("shape: Circle");
  }
}
//创建实现了Shape接口的抽象类
abstract class ShapeDecorator implements Shape {
  final Shape decoratedShape;
  ShapeDecorator(this.decoratedShape);
  @override
  void draw() {
    decoratedShape.draw();
  }
}

class RunDecorator implements Run {
  @override
  void main() {}
  @override
  String name = "";
}
