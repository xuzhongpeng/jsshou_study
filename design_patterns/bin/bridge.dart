

import 'run.dart';
//咖啡售卖系统中，容量作为抽象化（Abstraction），口味作为实现化（Implementor）
//创建口味接口
abstract class ICoffeeAdditives {
    void addSomething();
}
// 创建抽象化
abstract class Coffee {
  ICoffeeAdditives additives;
  Coffee(this.additives);
  void orderCoffee(int count);
}
//修正抽象化类，增加品控方法
abstract class RefinedCoffee extends Coffee{
  RefinedCoffee(ICoffeeAdditives additives) : super(additives);
  checkQuality(int score){
    print("添加太多");
  }
}

class RunBridge implements Run{
  @override
  String name="桥接模式";

  @override
  main() {

  }
}