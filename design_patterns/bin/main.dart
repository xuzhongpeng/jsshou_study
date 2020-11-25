import 'adapter.dart';
import 'bridge.dart';
import 'builder_pattern.dart';
import 'decorator.dart';
import 'facade.dart';
import 'factory.dart';
import 'flyweight.dart';
import 'proxy.dart';
import 'run.dart';
import 'singleton.dart';
import 'prototype.dart';

main() {
  List<Run> run = [
    //工厂模式
    RunFactory(),
    //单例模式
    RunSingleTon(),
    //建造者模式
    RunBuilderPattern(),
    //原型模式
    RunPrototype(),
    //适配器模式
    RunAdapter(),
    //桥接模式
    RunBridge(),
    //装饰器模式
    RunDecorator(),
    //外观模式
    RunFacade(),
    //享元模式
    RunFlyweight(),
    //代理模式
    RunProxy()
  ];
  run.forEach((r) {
    print("\n***********${r.name}开始创建***********");
    r.main();
    print("*************${r.name}结束*************\n");
  });
}
