import 'factory.dart';
import 'run.dart';
import 'singleton.dart';

main() {
  List<Run> run = [
    //工厂模式
    RunFactory(), 
    //单例模式
    RunSingleTon(),
  ];
  run.forEach((r) => r.main());
}
