import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/analyzer.dart';
import 'package:front_end/src/scanner/token.dart';

String src = """
import 'package:flutter/material.dart';
Dynamism d = new Dynamism(expert:true);
main(){
var o = new Object();
d.on(o).hi = 'bye';
}
class Test extends Navigator{
  Test(this.test1);
  String test1;
  String test2;
}
class Test extends Navigator{
  Test(this.test1);
  String test1;
  String test2;
}
""";

getAst() {
  var ast = parseCompilationUnit(src, parseFunctionBodies: true);
  print('initial value: ');
  print(ast.toSource());
  var v = new Visitor();
  ast.visitChildren(v);
  print('After modification:');
  print(ast.toSource());
}

class Visitor extends RecursiveAstVisitor {

  @override
  visitFieldFormalParameter(FieldFormalParameter node) {
    print(node.toSource());
    return super.visitFieldFormalParameter(node);
  }

  @override
  visitFieldDeclaration(FieldDeclaration node) {
    print(node.toSource());
    return super.visitFieldDeclaration(node);
  }

  @override
  visitAssignmentExpression(AssignmentExpression node) {
    print("****");
    print(node.toSource());
//filter
    var p = new RegExp(r'.*\.on\(\w\)');
    if (!p.hasMatch(node.toString())) return;

//replace
    SimpleStringLiteral ssl = _create_SimpleStringLiteral(node);
    node.parent.accept(new NodeReplacer(node, ssl));
  }
}

SimpleStringLiteral _create_SimpleStringLiteral(AstNode node) {
  String new_string = modify(node.toString());
  int line_num = node.offset;
//holds the position and type
  StringToken st = new StringToken(TokenType.STRING, new_string, line_num);
  return astFactory.simpleStringLiteral(st, new_string);
}

String modify(String s) {
  List parts = s.split('=');
  var value = parts[1];
  List l = parts[0].split('.');
  String dynamism = l.sublist(0, l.length - 1).join('.');
  String propertyName = l.last.trim();
  return '${dynamism}.set("${propertyName}",${value})';
}
