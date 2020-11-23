

import 'run.dart';
//咖啡售卖系统中，容量作为抽象化（Abstraction），口味作为实现化（Implementor）
// 创建抽象化
abstract class Coffee {
  ICoffee
}

class RunBridge implements Run{
  @override
  String name="桥接模式";

  @override
  main() {

  }
}