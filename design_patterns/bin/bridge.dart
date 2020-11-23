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
abstract class RefinedCoffee extends Coffee {
  RefinedCoffee(ICoffeeAdditives additives) : super(additives);
  checkQuality(int score) {
    print("添加" + score.toString() + "%");
  }
}

//创建实现化部分
class Milk implements ICoffeeAdditives {
  @override
  void addSomething() {
    print("加奶");
  }
}

class Sugar implements ICoffeeAdditives {
  @override
  void addSomething() {
    print("加糖");
  }
}

class LargeCoffee extends RefinedCoffee {
  LargeCoffee(ICoffeeAdditives additives) : super(additives);

  @override
  void orderCoffee(int count) {
    additives.addSomething();
    print("大杯咖啡" + count.toString() + "杯");
  }
}
class MidCoffee extends RefinedCoffee {
  MidCoffee(ICoffeeAdditives additives) : super(additives);

  @override
  void orderCoffee(int count) {
    additives.addSomething();
    print("中杯咖啡" + count.toString() + "杯");
  }
}
class RunBridge implements Run {
  @override
  String name = "桥接模式";

  @override
  main() {
    RefinedCoffee largeWithMilk = new LargeCoffee(Milk());
    largeWithMilk.orderCoffee(2);
    largeWithMilk.checkQuality(90);
    print("\n");
    RefinedCoffee largeWithSugar = new MidCoffee(Sugar());
    largeWithSugar.orderCoffee(1);
    largeWithSugar.checkQuality(100);
  }
}
