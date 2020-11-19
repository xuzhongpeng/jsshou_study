//单例模式
import 'run.dart';

class _SingleTon {
  _SingleTon._();
  //第一种方式调用
  factory _SingleTon() {
    return instance;
  }
  //第二种方式调用
  static _SingleTon instance = _SingleTon._();
  int count = 0;
}

class RunSingleTon implements Run {
  @override
  main() {
    print(_SingleTon().count++);
    print(_SingleTon.instance.count++);
    print(_SingleTon.instance.count++);
  }
  @override
  String name="单例模式";
}
