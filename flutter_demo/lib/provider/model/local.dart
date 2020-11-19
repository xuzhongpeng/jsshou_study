/*
 * @Author: xuzhongpeng
 * @email: xuzhongpeng@foxmail.com
 * @Date: 2019-08-07 16:06:33
 * @LastEditors: xuzhongpeng
 * @LastEditTime: 2019-09-19 20:47:55
 */
import 'package:flutter/cupertino.dart';

import './model.dart';

class LocalIntl extends Model {
  Locale locale = new Locale('en', '');

  void change() {
    if (locale.languageCode == 'en') {
      this.locale = Locale('zh', '');
    } else {
      this.locale = Locale('en', '');
    }
    notifyListeners();
  }
}
