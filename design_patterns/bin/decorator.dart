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

//创建扩展了 ShapeDecorator 类的实体装饰类。
class RedShapeDecorator extends ShapeDecorator {
  RedShapeDecorator(Shape decoratedShape) : super(decoratedShape);
  @override
  void draw() {
    decoratedShape.draw();
    _setRedBorder(decoratedShape);
  }

  void _setRedBorder(Shape decoratedShape) {
    print("Border Color: Red");
  }
}
//使用 RedShapeDecorator 来装饰 Shape 对象。

class RunDecorator implements Run {
  @override
  void main() {
    Shape circle = new Circle();
    // ShapeDecorator redCircle = new RedShapeDecorator(new Circle());
    // ShapeDecorator redRectangle = new RedShapeDecorator(new Rectangle());
    Shape redCircle = new RedShapeDecorator(new Circle());
    Shape redRectangle = new RedShapeDecorator(new Rectangle());
    print("Circle with normal border");
    circle.draw();

    print("\nCircle of red border");
    redCircle.draw();

    print("\nRectangle of red border");
    redRectangle.draw();
  }

  @override
  String name = "装饰器模式";
}
