import 'dart:io';

import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/analysis/results.dart';
// import 'package:front_end/src/scanner/token.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
List<String> classNames = [];
getAstTest() {
  File file = File('bin/dart_ast/code/ast_class.dart');
  // var ast =
  //     parseCompilationUnit(file.readAsStringSync(), parseFunctionBodies: true);
  ParseStringResult ast =
      parseString(content:file.readAsStringSync());
  print('initial value: ');
  print(ast.unit.toSource());
  var v = new Visitor();
  ast.unit.visitChildren(v);
  print('After modification:');
  print(ast.unit.toSource());
}

class Visitor<R> extends RecursiveAstVisitor {
//   @override
//   R visitAdjacentStrings(AdjacentStrings node) {
//     node.visitChildren(this);
//     print("visitAdjacentStrings:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAnnotation(Annotation node) {
//     node.visitChildren(this);
//     print("visitAnnotation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitArgumentList(ArgumentList node) {
//     node.visitChildren(this);
//     print("visitArgumentList:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAsExpression(AsExpression node) {
//     node.visitChildren(this);
//     print("visitAsExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAssertInitializer(AssertInitializer node) {
//     node.visitChildren(this);
//     print("visitAssertInitializer:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAssertStatement(AssertStatement node) {
//     node.visitChildren(this);
//     print("visitAssertStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAssignmentExpression(AssignmentExpression node) {
//     node.visitChildren(this);
//     print("visitAssignmentExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitAwaitExpression(AwaitExpression node) {
//     node.visitChildren(this);
//     print("visitAwaitExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitBinaryExpression(BinaryExpression node) {
//     node.visitChildren(this);
//     print("visitBinaryExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitBlock(Block node) {
//     node.visitChildren(this);
//     print("visitBlock:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitBlockFunctionBody(BlockFunctionBody node) {
//     node.visitChildren(this);
//     print("visitBlockFunctionBody:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitBooleanLiteral(BooleanLiteral node) {
//     node.visitChildren(this);
//     print("visitBooleanLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitBreakStatement(BreakStatement node) {
//     node.visitChildren(this);
//     print("visitBreakStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitCascadeExpression(CascadeExpression node) {
//     node.visitChildren(this);
//     print("visitCascadeExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitCatchClause(CatchClause node) {
//     node.visitChildren(this);
//     print("visitCatchClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitClassDeclaration(ClassDeclaration node) {
//     node.visitChildren(this);
//     print("visitClassDeclaration:" + node.toSource());
//     print(node.name);
//     return null;
//   }

//   @override
//   R visitClassTypeAlias(ClassTypeAlias node) {
//     node.visitChildren(this);
//     print("visitClassTypeAlias:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitComment(Comment node) {
//     node.visitChildren(this);
//     print("visitComment:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitCommentReference(CommentReference node) {
//     node.visitChildren(this);
//     print("visitCommentReference:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitCompilationUnit(CompilationUnit node) {
//     // node.visitChildren(this);
//     print("visitCompilationUnit:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitConditionalExpression(ConditionalExpression node) {
//     node.visitChildren(this);
//     print("visitConditionalExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitConfiguration(Configuration node) {
//     node.visitChildren(this);
//     print("visitConfiguration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitConstructorDeclaration(ConstructorDeclaration node) {
//     node.visitChildren(this);
//     print("visitConstructorDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitConstructorFieldInitializer(ConstructorFieldInitializer node) {
//     node.visitChildren(this);
//     print("visitConstructorFieldInitializer:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitConstructorName(ConstructorName node) {
//     node.visitChildren(this);
//     print("visitConstructorName:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitContinueStatement(ContinueStatement node) {
//     node.visitChildren(this);
//     print("visitContinueStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitDeclaredIdentifier(DeclaredIdentifier node) {
//     node.visitChildren(this);
//     print("visitDeclaredIdentifier:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitDefaultFormalParameter(DefaultFormalParameter node) {
//     node.visitChildren(this);
//     print("visitDefaultFormalParameter:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitDoStatement(DoStatement node) {
//     node.visitChildren(this);
//     print("visitDoStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitDottedName(DottedName node) {
//     node.visitChildren(this);
//     print("visitDottedName:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitDoubleLiteral(DoubleLiteral node) {
//     node.visitChildren(this);
//     print("visitDoubleLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitEmptyFunctionBody(EmptyFunctionBody node) {
//     node.visitChildren(this);
//     print("visitEmptyFunctionBody:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitEmptyStatement(EmptyStatement node) {
//     node.visitChildren(this);
//     print("visitEmptyStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitEnumConstantDeclaration(EnumConstantDeclaration node) {
//     node.visitChildren(this);
//     print("visitEnumConstantDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitEnumDeclaration(EnumDeclaration node) {
//     node.visitChildren(this);
//     print("visitEnumDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitExportDirective(ExportDirective node) {
//     node.visitChildren(this);
//     print("visitExportDirective:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitExpressionFunctionBody(ExpressionFunctionBody node) {
//     node.visitChildren(this);
//     print("visitExpressionFunctionBody:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitExpressionStatement(ExpressionStatement node) {
//     node.visitChildren(this);
//     print("visitExpressionStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitExtendsClause(ExtendsClause node) {
//     node.visitChildren(this);
//     print("visitExtendsClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFieldDeclaration(FieldDeclaration node) {
//     node.visitChildren(this);
//     print("visitFieldDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFieldFormalParameter(FieldFormalParameter node) {
//     node.visitChildren(this);
//     print("visitFieldFormalParameter:" + node.toSource());
//     return null;
//   }

//   // @override
//   // R visitForEachStatement(ForEachStatement node) {
//   //   node.visitChildren(this);
//   //   print("visitForEachStatement:" + node.toSource());
//   //   return null;
//   // }

//   @override
//   R visitFormalParameterList(FormalParameterList node) {
//     node.visitChildren(this);
//     print("visitFormalParameterList:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitForStatement(ForStatement node) {
//     node.visitChildren(this);
//     print("visitForStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionDeclaration(FunctionDeclaration node) {
//     node.visitChildren(this);
//     print("visitFunctionDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionDeclarationStatement(FunctionDeclarationStatement node) {
//     node.visitChildren(this);
//     print("visitFunctionDeclarationStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionExpression(FunctionExpression node) {
//     node.visitChildren(this);
//     print("visitFunctionExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
//     node.visitChildren(this);
//     print("visitFunctionExpressionInvocation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionTypeAlias(FunctionTypeAlias node) {
//     node.visitChildren(this);
//     print("visitFunctionTypeAlias:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitFunctionTypedFormalParameter(FunctionTypedFormalParameter node) {
//     node.visitChildren(this);
//     print("visitFunctionTypedFormalParameter:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitGenericFunctionType(GenericFunctionType node) {
//     node.visitChildren(this);
//     print("visitGenericFunctionType:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitGenericTypeAlias(GenericTypeAlias node) {
//     node.visitChildren(this);
//     print("visitGenericTypeAlias:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitHideCombinator(HideCombinator node) {
//     node.visitChildren(this);
//     print("visitHideCombinator:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitIfStatement(IfStatement node) {
//     node.visitChildren(this);
//     print("visitIfStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitImplementsClause(ImplementsClause node) {
//     node.visitChildren(this);
//     print("visitImplementsClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitImportDirective(ImportDirective node) {
//     node.visitChildren(this);
//     print("visitImportDirective:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitIndexExpression(IndexExpression node) {
//     node.visitChildren(this);
//     print("visitIndexExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitInstanceCreationExpression(InstanceCreationExpression node) {
//     node.visitChildren(this);
//     print("visitInstanceCreationExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitIntegerLiteral(IntegerLiteral node) {
//     node.visitChildren(this);
//     print("visitIntegerLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitInterpolationExpression(InterpolationExpression node) {
//     node.visitChildren(this);
//     print("visitInterpolationExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitInterpolationString(InterpolationString node) {
//     node.visitChildren(this);
//     print("visitInterpolationString:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitIsExpression(IsExpression node) {
//     node.visitChildren(this);
//     print("visitIsExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitLabel(Label node) {
//     node.visitChildren(this);
//     print("visitLabel:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitLabeledStatement(LabeledStatement node) {
//     node.visitChildren(this);
//     print("visitLabeledStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitLibraryDirective(LibraryDirective node) {
//     node.visitChildren(this);
//     print("visitLibraryDirective:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitLibraryIdentifier(LibraryIdentifier node) {
//     node.visitChildren(this);
//     print("visitLibraryIdentifier:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitListLiteral(ListLiteral node) {
//     node.visitChildren(this);
//     print("visitListLiteral:" + node.toSource());
//     return null;
//   }

//   // @override
//   // R visitMapLiteral(MapLiteral node) {
//   //   node.visitChildren(this);
//   //   print("visitMapLiteral:" + node.toSource());
//   //   return null;
//   // }

//   @override
//   R visitMapLiteralEntry(MapLiteralEntry node) {
//     node.visitChildren(this);
//     print("visitMapLiteralEntry:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitMethodDeclaration(MethodDeclaration node) {
//     node.visitChildren(this);
//     print("visitMethodDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitMethodInvocation(MethodInvocation node) {
//     node.visitChildren(this);
//     print("visitMethodInvocation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitMixinDeclaration(MixinDeclaration node) {
//     node.visitChildren(this);
//     print("visitMixinDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitNamedExpression(NamedExpression node) {
//     node.visitChildren(this);
//     print("visitNamedExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitNativeClause(NativeClause node) {
//     node.visitChildren(this);
//     print("visitNativeClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitNativeFunctionBody(NativeFunctionBody node) {
//     node.visitChildren(this);
//     print("visitNativeFunctionBody:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitNullLiteral(NullLiteral node) {
//     node.visitChildren(this);
//     print("visitNullLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitOnClause(OnClause node) {
//     node.visitChildren(this);
//     print("visitOnClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitParenthesizedExpression(ParenthesizedExpression node) {
//     node.visitChildren(this);
//     print("visitParenthesizedExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPartDirective(PartDirective node) {
//     node.visitChildren(this);
//     print("visitPartDirective:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPartOfDirective(PartOfDirective node) {
//     node.visitChildren(this);
//     print("visitPartOfDirective:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPostfixExpression(PostfixExpression node) {
//     node.visitChildren(this);
//     print("visitPostfixExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPrefixedIdentifier(PrefixedIdentifier node) {
//     node.visitChildren(this);
//     print("visitPrefixedIdentifier:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPrefixExpression(PrefixExpression node) {
//     node.visitChildren(this);
//     print("visitPrefixExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitPropertyAccess(PropertyAccess node) {
//     node.visitChildren(this);
//     print("visitPropertyAccess:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitRedirectingConstructorInvocation(
//       RedirectingConstructorInvocation node) {
//     node.visitChildren(this);
//     print("visitRedirectingConstructorInvocation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitRethrowExpression(RethrowExpression node) {
//     node.visitChildren(this);
//     print("visitRethrowExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitReturnStatement(ReturnStatement node) {
//     node.visitChildren(this);
//     print("visitReturnStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitScriptTag(ScriptTag node) {
//     node.visitChildren(this);
//     print("visitScriptTag:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitShowCombinator(ShowCombinator node) {
//     node.visitChildren(this);
//     print("visitShowCombinator:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSimpleFormalParameter(SimpleFormalParameter node) {
//     node.visitChildren(this);
//     print("visitSimpleFormalParameter:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSimpleIdentifier(SimpleIdentifier node) {
//     node.visitChildren(this);
//     print("visitSimpleIdentifier:" + node.toSource());
//     print(node.name);
//     return null;
//   }

//   @override
//   R visitSimpleStringLiteral(SimpleStringLiteral node) {
//     node.visitChildren(this);
//     print("visitSimpleStringLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitStringInterpolation(StringInterpolation node) {
//     node.visitChildren(this);
//     print("visitStringInterpolation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSuperConstructorInvocation(SuperConstructorInvocation node) {
//     node.visitChildren(this);
//     print("visitSuperConstructorInvocation:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSuperExpression(SuperExpression node) {
//     node.visitChildren(this);
//     print("visitSuperExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSwitchCase(SwitchCase node) {
//     node.visitChildren(this);
//     print("visitSwitchCase:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSwitchDefault(SwitchDefault node) {
//     node.visitChildren(this);
//     print("visitSwitchDefault:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSwitchStatement(SwitchStatement node) {
//     node.visitChildren(this);
//     print("visitSwitchStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitSymbolLiteral(SymbolLiteral node) {
//     node.visitChildren(this);
//     print("visitSymbolLiteral:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitThisExpression(ThisExpression node) {
//     node.visitChildren(this);
//     print("visitThisExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitThrowExpression(ThrowExpression node) {
//     node.visitChildren(this);
//     print("visitThrowExpression:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
//     node.visitChildren(this);
//     print("visitTopLevelVariableDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTryStatement(TryStatement node) {
//     node.visitChildren(this);
//     print("visitTryStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTypeArgumentList(TypeArgumentList node) {
//     node.visitChildren(this);
//     print("visitTypeArgumentList:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTypeName(TypeName node) {
//     node.visitChildren(this);
//     print("visitTypeName:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTypeParameter(TypeParameter node) {
//     node.visitChildren(this);
//     print("visitTypeParameter:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitTypeParameterList(TypeParameterList node) {
//     node.visitChildren(this);
//     print("visitTypeParameterList:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitVariableDeclaration(VariableDeclaration node) {
//     node.visitChildren(this);
//     print("visitVariableDeclaration:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitVariableDeclarationList(VariableDeclarationList node) {
//     node.visitChildren(this);
//     print("visitVariableDeclarationList:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitVariableDeclarationStatement(VariableDeclarationStatement node) {
//     node.visitChildren(this);
//     print("visitVariableDeclarationStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitWhileStatement(WhileStatement node) {
//     node.visitChildren(this);
//     print("visitWhileStatement:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitWithClause(WithClause node) {
//     node.visitChildren(this);
//     print("visitWithClause:" + node.toSource());
//     return null;
//   }

//   @override
//   R visitYieldStatement(YieldStatement node) {
//     node.visitChildren(this);
//     print("visitYieldStatement:" + node.toSource());
//     return null;
//   }
}

// SimpleStringLiteral _create_SimpleStringLiteral(AstNode node) {
//   String new_string = modify(node.toString());
//   int line_num = node.offset;
// //holds the position and type
//   StringToken st = new StringToken(TokenType.STRING, new_string, line_num);
//   return astFactory.simpleStringLiteral(st, new_string);
// }

// String modify(String s) {
//   List parts = s.split('=');
//   var value = parts[1];
//   List l = parts[0].split('.');
//   String dynamism = l.sublist(0, l.length - 1).join('.');
//   String propertyName = l.last.trim();
//   return '${dynamism}.set("${propertyName}",${value})';
// }
