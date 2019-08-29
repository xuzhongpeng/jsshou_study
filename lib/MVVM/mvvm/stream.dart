import 'package:flutter/cupertino.dart';
import 'dart:async';

class MvvmStream extends InheritedWidget {
  MvvmStream({Key key, @required StreamController stream, Widget child})
      : _stream = stream,
        super(key: key, child: child);

  final StreamController _stream;

  @override
  bool updateShouldNotify(MvvmStream oldWidget) {
    return oldWidget._stream != _stream;
  }

  static StreamController of(BuildContext context) {
    final type = _typeOf<MvvmStream>();
    final provider = context.inheritFromWidgetOfExactType(type) as MvvmStream;
    if (provider == null) throw StoreProviderError(type);
    return provider._stream;
  }

  // Workaround to capture generics
  static Type _typeOf<T>() => T;
}

class StoreProviderError extends Error {
  /// The type of the class the user tried to retrieve
  Type type;

  /// Creates a StoreProviderError
  StoreProviderError(this.type);

  @override
  String toString() {
    return '''Error: No $type found. To fix, please try:
          
  * Wrapping your MaterialApp with the StoreProvider<State>, 
  rather than an individual Route
  * Providing full type information to your Store<State>, 
  StoreProvider<State> and StoreConnector<State, ViewModel>
  * Ensure you are using consistent and complete imports. 
  E.g. always use `import 'package:my_app/app_state.dart';
  
If none of these solutions work, please file a bug at:
https://github.com/brianegan/flutter_redux/issues/new
      ''';
  }
}
