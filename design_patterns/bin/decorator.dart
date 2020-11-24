import 'run.dart';
//创建接口
abstract class Shape {
  void draw();
}
//创建接口实体类
class Rectangle implements Shape {
  @override
  void draw() {
    // TODO: implement draw
  }

}

class RunDecorator implements Run {
  @override
  void main() {}
  @override
  String name = "";
}
