/*
 * @Author: xuzhongpeng
 * @email: xuzhongpeng@foxmail.com
 * @Date: 2019-08-07 16:06:33
 * @LastEditors: xuzhongpeng
 * @LastEditTime: 2019-08-20 10:52:09
 */
import './model.dart';

class Counter extends Model {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    count--;
    notifyListeners();
  }
}
