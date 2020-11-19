import 'factory.dart';
import 'run.dart';

main() {
  List<Run> run = [
    //工厂模式
    RunFactory()];
  run.forEach((r) => r.main());
}
