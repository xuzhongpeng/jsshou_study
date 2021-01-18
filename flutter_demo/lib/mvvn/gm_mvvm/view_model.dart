import 'package:flutter/material.dart';

import 'view.dart';

abstract class ViewModel extends ViewModelBase {}

abstract class ViewModelBase extends _ViewModelBase {}

abstract class _ViewModelBase {
  _ViewModelBase() {
    _data = setData();
  }
  ViewModelMap _data;

  ViewModelMap get data => _data;

  ViewModelMap setData();

  /// 关联的视图 [View] 初始化前调用此方法

  /* @protected
  void attachView(BuildContext context, ViewWidget view) {}

  @protected
  void detachView(BuildContext context, ViewWidget view) {} */
}

class ViewModelMap<K, V> implements Map<K, V> {
  ViewModelMap(this._base) : super();
  ViewBase viewBase;
  Map<K, V> _base;
  V operator [](Object key) {
    print(key);
    return _base[key];
  }

  @override
  void operator []=(K key, V value) {
    viewBase.setState(() {
      this._base[key] = value;
    });
  }

  @override
  void addAll(Map<K, V> other) {}

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {}

  @override
  Map<RK, RV> cast<RK, RV>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  bool containsKey(Object key) {
    throw UnimplementedError();
  }

  @override
  bool containsValue(Object value) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement entries
  Iterable<MapEntry<K, V>> get entries => throw UnimplementedError();

  @override
  void forEach(void f(K key, V value)) {}

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();

  @override
  // TODO: implement keys
  Iterable<K> get keys => throw UnimplementedError();

  @override
  // TODO: implement length
  int get length => throw UnimplementedError();

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> transform(K key, V value)) {
    throw UnimplementedError();
  }

  @override
  V putIfAbsent(K key, V ifAbsent()) {
    // Tkey, V Function() ifAbsekey, VVV Function() valueent) {
    // TODO: implement putIfAbsent
    throw UnimplementedError();
  }

  @override
  V remove(Object key) {
    throw UnimplementedError();
  }

  @override
  void removeWhere(bool test(K key, V value)) {
    // TV key, V valV key, V value) {
    // Tkey, V value) predicate)key, VVV value) key, Vate) {
    // TODO: implement removeWhere
  }

  @override
  // ignore: missing_return
  V update(K key, V update(V value), {V ifAbsent()}) {}

  @override
  void updateAll(V update(K key, V value)) {
    _base.updateAll((key, value) => update(key, value));
  }

  @override
  // TODO: implement values
  Iterable<V> get values => _base.values;
}
