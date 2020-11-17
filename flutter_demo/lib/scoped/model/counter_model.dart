/*
 * @Author: xuzhongpeng
 * @email: xuzhongpeng@foxmail.com
 * @Date: 2019-08-07 16:06:33
 * @LastEditors: xuzhongpeng
 * @LastEditTime: 2019-09-10 19:18:48
 */
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/foundation.dart' show ChangeNotifier;

class Counter extends Model {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
