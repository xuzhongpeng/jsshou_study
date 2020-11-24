import 'dart:math' as math;

import 'run.dart';

abstract class Shape {
  void draw();
}

// 创建实现接口的实体类。
class Circle implements Shape {
  String color;
  int x;
  int y;
  int radius;
  Circle(String color) {
    this.color = color;
  }
  void setX(int x) {
    this.x = x;
  }

  void setY(int y) {
    this.y = y;
  }

  void setRadius(int radius) {
    this.radius = radius;
  }

  @override
  void draw() {
    print("Circle: Draw() [Color : " +
        color +
        ", x : " +
        x.toString() +
        ", y :" +
        y.toString() +
        ", radius :" +
        radius.toString());
  }
}

// 创建一个工厂，生成基于给定信息的实体类的对象。
class ShapeFactory {
  static final Map<String, Shape> circleMap = new Map();

  static Shape getCircle(String color) {
    Circle circle = circleMap[color];

    if (circle == null) {
      circle = new Circle(color);
      circleMap[color] = circle;
      print("Creating circle of color : " + color);
    }
    return circle;
  }
}

class RunFlyweight implements Run {
  final List<String> colors = ["Red", "Green", "Blue", "White", "Black"];
  @override
  void main() {
    for (int i = 0; i < 20; ++i) {
      Circle circle = ShapeFactory.getCircle(getRandomColor());
      circle.setX(getRandomX());
      circle.setY(getRandomY());
      circle.setRadius(100);
      circle.draw();
    }
  }

  String getRandomColor() {
    return colors[math.Random().nextInt(colors.length)];
  }

  int getRandomX() {
    return math.Random().nextInt(100);
  }

  int getRandomY() {
    return math.Random().nextInt(100);
  }

  @override
  String name = "享元模式";
}
