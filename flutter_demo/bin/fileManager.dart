import 'dart:io';

import 'getFlutter.dart';
// ignore: unused_import
import 'package:mysql1/mysql1.dart';

abstract class Manager {
  List<String> projectPath;
  Future<List<String>> getAllFilesPath();
}

class FileManager implements Manager {
  @override
  List<String> projectPath = [
    "/Users/admin/Desktop/company/flutter/gm_single_page",
    "/Users/admin/Desktop/company/flutter/staffperformance-master",
    "/Users/admin/Desktop/company/flutter/base_list",
    "/Users/admin/Desktop/company/flutter/gm_networking",
    "/Users/admin/Desktop/company/flutter/gm_browser",
    "/Users/admin/Desktop/company/flutter/developcenter",
    "/Users/admin/Desktop/company/flutter/flutter_webview_plugin",
    "/Users/admin/Desktop/company/flutter/gm_platform_channels",
    "/Users/admin/Desktop/company/flutter/gm_managementcenter",
    "/Users/admin/Desktop/company/flutter/gm_menu_button",
    "/Users/admin/Desktop/company/flutter/gm_webview",
    "/Users/admin/Desktop/company/flutter/gmwebview",
    "/Users/admin/Desktop/company/flutter/trojan",
    "/Users/admin/Desktop/company/flutter/gm_single_page/packages/gm_utils",
    "/Users/admin/Desktop/company/flutter/gm_single_page/packages/gm_uikit",
    "/Users/admin/Desktop/company/new_flutter/flutter_colorsizemanage",
    "/Users/admin/Desktop/company/new_flutter/qrcode",
  ];

  @override
  Future<List<String>> getAllFilesPath() async {
    if (!await MySqlManager.connect()) {
      throw "数据库连接错误";
    }
    for (var dir in projectPath) {
      await getLibPaths(Directory(dir + "/lib"));
      // Ast.getAst('bin/astDemo.dart');
    }
    print("总共方法数量" + _methodNumber.toString());
    print("总共错误文件数量" + _errorNumber.toString());
    MySqlManager.close();
    return null;
  }

  goods() => {};
  int _classNumber = 0;
  int _methodNumber = 0;
  int _errorNumber = 0;
  Future<List<String>> getLibPaths(Directory directory) async {
    final List<FileSystemEntity> children = directory.listSync();
    for (final FileSystemEntity child in children) {
      if (child is Directory) {
        // print(child.path);
        await getLibPaths(child);
      } else if (child is File && child.path.split('.').last == 'dart') {
        print("文件地址" + child.path);
        try {
          List<ClassMethod> list = Ast.getAst(child.path);
          MySqlManager.insert(list);
          _methodNumber += list.length;
        } catch (e) {
          _errorNumber++;
          print('文件地址' + child.path + "读取有误" + e.toString());
        }
      }
    }
  }
}

class MySqlManager {
  static MySqlConnection _conn;
  static Future<bool> connect() async {
    var settings = new ConnectionSettings(
        host: 'rm-bp1wn94th639pm21je6.mysql.rds.aliyuncs.com',
        port: 3306,
        user: 'gunma',
        password: '8Xno8Es4HIlQ95yD',
        db: 'gfe_method_analysis');
    _conn = await MySqlConnection.connect(settings);
    return _conn != null;
  }

  static Future<bool> insert(List<ClassMethod> method) async {
    var result = await _conn.queryMulti(
        'insert into data (platform, type, class,method,comment,input,output,method_line_count,method_char_count,desc) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        method.map((v) => v.toList()).toList()).catchError((MySqlException e){
          print(e.sqlState);
        });
    return result.length > 0;
  }

  static Future close() async {
    await _conn.close();
  }
}
