import 'run.dart';

abstract class Subject {
  void request();
}

class RealSubject implements Subject {
  @override
  void request() {
    print("RealSubject:Handling request");
  }
}

class SubjectProxy implements Subject {
  RealSubject _realSubject;
  @override
  void request() {
    if (this._checkAccess()) {
      this._realSubject.request();
      this._logAccess();
    }
  }

  bool _checkAccess() {
    print("Proxy: Checking access prior to firing a real request.");
    return true;
  }

  void _logAccess() {
    print("Proxy: Logging the time of request.");
  }
}

class RunProxy implements Run {
  @override
  void main() {}
  @override
  String name = "代理模式";
}
