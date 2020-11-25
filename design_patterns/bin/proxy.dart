import 'run.dart';

abstract class Subject {
  void request();
}

class RealSubject implements Subject {
  const RealSubject();
  @override
  void request() {
    print("RealSubject:Handling request");
  }
}

class SubjectProxy implements Subject {
  final RealSubject _realSubject;
  const SubjectProxy(this._realSubject);
  @override
  void request() {
    if (this._checkAccess()) {
      this._realSubject.request();
      this._logAccess();
    }
  }

  bool _checkAccess() {
    print("Proxy: 判断当前是否可连接");
    return true;
  }

  void _logAccess() {
    print("Proxy: 写一些日志比如连接时间");
  }
}

class RunProxy implements Run {
  @override
  void main() {
    print('Client: 使用RealSubject类：');
    const realSubject = const RealSubject();
    _clientCode(realSubject);
    print('');
    print('Client: 使用代理类：');
    const proxy = const SubjectProxy(realSubject);
    _clientCode(proxy);
  }

  _clientCode(Subject subject) {
    // ...

    subject.request();

    // ...
  }

  @override
  String name = "代理模式";
}
