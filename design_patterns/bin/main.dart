import 'builder_pattern.dart';
import 'factory.dart';
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
    RunPrototype()
  ];
  run.forEach((r) {
    print("\n******${r.name}开始创建**********");
    r.main();
  });
}
