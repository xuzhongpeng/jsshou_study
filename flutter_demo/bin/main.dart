// import "package:lpinyin/lpinyin.dart";
import 'dart:convert';

import "./downfiles.dart";
import 'dart_ast/getAst.dart';
import 'fileManager.dart';
import 'getFlutter.dart';
import 'reflection/demo.dart';
// import 'main.reflectable.dart';

String chart(List<int> items) {
  return jsonEncode({
    "kind": {"plotly": true},
    'data': [
      {'y': items}
    ]
  });
}

void main() {
  // List<String> a = ['测试', 'D白', '2da', '1大发', 'aaa', 'CCC'];
  // List<String> b =
  //     a.map((item) => PinyinHelper.getFirstWordPinyin(item)).toList();
  // b = b.map((item) => item.toLowerCase()).toList();
  // b.sort((a, b) => a.compareTo(b));

  // print(b.toString());
  // print(_createFileName(16));
  // print(DownFiles().getVersion('PRINT'));

  // initializeReflectable();
  // testReflection();
  String str =
      "https://api2.mc.app/index.php/system/qr_code?text=%7B%22type%22%3A%22s_bind%22%2C%22data%22%3A%7B%22key%22%3A%2295487612%22%2C%22company_name%22%3A%22J%26W+FASHION+DI+YAN+XINING%22%7D%7D&form=3";
  str = str.replaceAll("%26", "replaceStr");
  Uri uri = Uri.tryParse(Uri.decodeQueryComponent(str));

  String key = uri?.queryParameters['text'];
  key=key.replaceAll("replaceStr", "&");
  print(key);
  // getAstTest();

  // FileManager().getAllFilesPath();

  // DownFiles().loadFiles(
  //     "https://gunma-app.oss-cn-hangzhou.aliyuncs.com/303/duoke-settings-v1.2.29.zip",
  //     type: 'PRINT',
  //     version: "3.1.6");
}

String _createFileName(int day) {
  DateTime now = new DateTime.now();

  DateTime fileDay = new DateTime(now.year, now.month, now.day - day);
  return fileDay.year.toString() +
      '-' +
      fileDay.month.toString() +
      '-' +
      fileDay.day.toString() +
      '.log';
}
