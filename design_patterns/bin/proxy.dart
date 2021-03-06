import 'run.dart';

abstract class Subject {
  void request();
}

class RealSubject implements Subject {
  const RealSubject();
  @override
  void request() {
    print("RealSubject:正在连接");
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
    print('做一些连接前的事情');
    subject.request();

    // ...
  }

  @override
  String name = "代理模式";
}
