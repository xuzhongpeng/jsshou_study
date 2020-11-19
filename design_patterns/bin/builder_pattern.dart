//建造者模式

import 'run.dart';

//建造者模式的精髓在于抽象，要把内容都抽象成一个一个的类来实现
//标识食物的接口
abstract class Item {
  String name;
  Packing packing();
  double price;
}

//包装接口
abstract class Packing {
  String pack();
}

//实现包装接口的实体类
class Wrapper implements Packing {
  @override
  pack() {
    return "Wrapper";
  }
}

class Bottle implements Packing {
  @override
  String pack() {
    return "Bottle";
  }
}

///创建实现Item接口的抽象类
//使用包装纸包装的食物
abstract class Burger implements Item {
  @override
  Packing packing() {
    return new Wrapper();
  }
}
//使用瓶子包装的食物
abstract class ColdDrink implements Item {
  @override
  Packing packing() {
    return new Bottle();
  }
}

//创建扩展了Burger和ColdDrink的实体类
//蔬菜
class VegBurger extends Burger {
  @override
  String name = "Veg Burger";

  @override
  double price = 34.3;
}

//鸡肉汉堡包
class ChickenBurger extends Burger {
  @override
  String name = "Chicken Burger";
  @override
  double price = 56.2;
}

//可乐
class Coke extends ColdDrink {
  @override
  String name = "Coke";
  @override
  double price = 3;
}

//百事
class Pepsi extends ColdDrink {
  @override
  String name = "Pepsi";
  @override
  double price = 4;
}

//创建Meal类用于打印实例化的对象信息
class Meal {
  List<Item> _items = [];
  void addItem(Item item) => _items.add(item);
  //计算所有项目的总价
  double getCost() {
    double cost = 0;
    for (var item in _items) {
      cost += item.price;
    }
    return cost;
  }

  //展示当前项目
  showItems() {
    for (var item in _items) {
      print("item:" +
          item.name +
          ", Packing: " +
          item.packing().pack() +
          ", Price:" +
          item.price.toString());
    }
  }
}

class MealBuilder {
  Meal prepareVegMeal() {
    Meal meal = new Meal();
    meal.addItem(new VegBurger());
    meal.addItem(new Coke());
    return meal;
  }

  Meal prepareNonVegMeal() {
    Meal meal = new Meal();
    meal.addItem(new ChickenBurger());
    meal.addItem(new Pepsi());
    return meal;
  }
}

class RunBuilderPattern implements Run {
  @override
  main() {
    MealBuilder mealBuilder = new MealBuilder();
    Meal vegMeal = mealBuilder.prepareVegMeal();
    print("Veg Meal");
    vegMeal.showItems();
    print("Total Cost: " + vegMeal.getCost().toString());

    Meal nonVegMeal = mealBuilder.prepareNonVegMeal();
    print("\n\nNon-Veg Meal");
    nonVegMeal.showItems();
    print("Total Cost: " + nonVegMeal.getCost().toString());
  }
  @override
  String name="建造者模式";
}
