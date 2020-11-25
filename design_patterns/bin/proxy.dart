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
    print("Proxy: Checking access prior to firing a real request.");
    return true;
  }

  void _logAccess() {
    print("Proxy: Logging the time of request.");
  }
}

class RunProxy implements Run {
  @override
  void main() {
    print('Client: Executing the client code with a real subject:');
    const realSubject = const RealSubject();
    _clientCode(realSubject);
    print('');
    print('Client: Executing the same client code with a proxy:');
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
