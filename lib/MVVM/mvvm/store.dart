import './stream.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class Store<S> {
  S _state;
  S get state {
    // MvvmStream.of<this>()
    return _state;
  }

  BuildContext _context;

  set context(_) {
    this._context = _;
  }

  change() {
    StreamController a = MvvmStream.of(_context);
    a.sink.add(this);
  }

  Store(S state) {
    this._state = state;
  }
}
