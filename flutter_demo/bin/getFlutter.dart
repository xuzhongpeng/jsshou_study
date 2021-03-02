import 'dart:io';

import 'package:analyzer/analyzer.dart';

class Ast {
  static List<ClassMethod> classMethods = [];
//获取class 及 方法名
  static List<ClassMethod> getAst(String path) {
    classMethods = [];
    File file = File(path);
    var ast = parseCompilationUnit(file.readAsStringSync(),
        parseFunctionBodies: true);
    var v = new Visitor();
    ast.visitChildren(v);
    put();
    return classMethods;
  }

  //输出
  static put() {
    classMethods.forEach((c) => print(
        "类名：${c.className}  方法名：${c.methodName}  注释： ${c.annotation}  入参：${c.params} 出参：${c.returnParams}  备注：${c.asc} 行数：${c.lineNumber} 数量：${c.byte}"));
  }
}

class Visitor<R> extends RecursiveAstVisitor {
  @override
  R visitClassDeclaration(ClassDeclaration node) {
    node.visitChildren(this);
    print("class 名称" + node.name.toString());
    node.members.forEach((member) {
      //方法名
      if (member is MethodDeclaration) {
        ClassMethod cm = ClassMethod();
        cm.className = node.name.toString();
        //方法
        {
          cm.methodName = member.name.toString();
        }
        //注释
        {
          if (member.beginToken.value() == "String") {
            cm.annotation = member.beginToken.precedingComments.toString();
          } else {
            cm.annotation = member.beginToken.toString();
          }
        }
        // 入参
        {
          cm.params = member.parameters.toString();
        }
        // 出参
        {
          cm.returnParams = member.returnType.toString();
        }
        // 备注
        {}
        // 行数
        {}
        // 代码数量
        {
          cm.byte = member.body.length.toString();
        }
        Ast.classMethods.add(cm);
      }
      // else if (member is FieldDeclaration && !member.isStatic) {
      //   for (var field in member.fields.variables) {
      //     print("属性名称： " + field.name.toString());
      //   }
      // }
    });

    return null;
  }
}

class ClassMethod {
  String platform = "Flutter";
  String className;
  String methodName;
  //注释
  String annotation;
  //入参
  String params;
  //出参
  String returnParams;
  // 备注
  String asc;
  // 行数
  String lineNumber;
  // 字节数
  String byte;

  List<String> toList() {
    return [
      this.platform ?? "",
      '',
      this.className ?? "",
      this.methodName ?? "",
      this.annotation ?? "",
      this.params ?? "",
      this.returnParams ?? "",
      this.lineNumber ?? "",
      this.byte ?? "",
      this.asc ?? ""
    ];
  }
}
