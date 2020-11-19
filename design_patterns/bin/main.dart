import 'builder_pattern.dart';
import 'factory.dart';
import 'run.dart';
import 'singleton.dart';

main() {
  List<Run> run = [
    //工厂模式
    RunFactory(), 
    //单例模式
    RunSingleTon(),
    //建造者模式
    RunBuilderPattern()
  ];
  run.forEach((r) => r.main());
}
