// import "package:lpinyin/lpinyin.dart";
import 'dart:convert';

// import "./downfiles.dart";
// import 'dart_ast/getAst.dart';
import 'fileManager.dart';
// import 'getFlutter.dart';
import 'reflection/demo.dart';

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
  
  // getAstTest();

  FileManager().getAllFilesPath();

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
