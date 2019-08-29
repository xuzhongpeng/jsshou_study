import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './stream.dart';
import './store.dart';
import 'dart:async';

abstract class MvvmWidget<S> extends Widget {
  const MvvmWidget({Key key}) : super(key: key);

  @protected
  S getMvvmState();

  // MvvmState state=getMvvmState();
  @override
  MvvmElement createElement() => MvvmElement<S>(this);

  // notify(BuildContext context, S data) {
  //   StreamController a = MvvmStream.of(context);
  //   a.sink.add(data);
  // }

  @protected
  Widget build(BuildContext context, Store store);
}

class MvvmElement<S> extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  MvvmElement(MvvmWidget widget)
      : _state = widget.getMvvmState(),
        super(widget);
  S _state;
  StreamController<Store> _streamController =
      StreamController<Store>.broadcast();
  BuildContext _context;

  notify() {
    // StreamController a = MvvmStream.of(_context);
    // a.sink.add(this);
  }
  // S get state=> _typeOf<MvvmElement<S>>();

  // Workaround to capture generics
  @override
  MvvmWidget get widget => super.widget;

  @override
  Widget build() {
    return MvvmStream(
      stream: _streamController,
      child: StreamBuilder<Store>(
        stream: _streamController.stream,
        initialData: Store(_state),
        builder: (BuildContext context, AsyncSnapshot<Store> snapshot) {
          snapshot.data.context = context;
          return widget.build(context, snapshot.data);
        },
      ),
    );
  }

  @override
  void update(MvvmWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    // _dirty = true;
    rebuild();
  }
}
