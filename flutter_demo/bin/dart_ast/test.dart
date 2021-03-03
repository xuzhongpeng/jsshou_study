import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/analysis/results.dart';
// import 'package:front_end/src/scanner/token.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'getAst.dart';

// astTest() async {
//   ResolvedUnitResult result = await resolveFile([
//     "/Users/admin/Desktop/myCode/flutter/my_test/flutter_demo/bin/dart_ast/code/ast_class.dart",
//     "/Users/admin/Desktop/myCode/flutter/my_test/flutter_demo/bin/dart_ast/code/ast_tools.dart",
//   ]);
//   CompilationUnit resolvedUnit = result.unit;
//   CompilationUnitElement element = resolvedUnit.declaredElement;
//   var v = new Visitor();
//   resolvedUnit.visitChildren(v);
// }

// Future<ResolvedUnitResult> resolveFile(List<String> path) async {
//   AnalysisContextCollection collection = new AnalysisContextCollection(
//     includedPaths: path,
//     resourceProvider: PhysicalResourceProvider.INSTANCE,
//   );
//   AnalysisContext context = collection.contextFor(path.first);
//   return await context.currentSession.getResolvedUnit(path.first);
// }
PhysicalResourceProvider resourceProvider = PhysicalResourceProvider.INSTANCE;
  DartSdk sdk = new FolderBasedDartSdk(
  resourceProvider, resourceProvider.getFolder('/Users/admin/Desktop/myCode/flutter/my_test/flutter_demo/bin/dart_ast/code/'));

  var resolvers = [
    new DartUriResolver(sdk),
    new ResourceUriResolver(resourceProvider)
  ];

  AnalysisContextImpl context = AnalysisEngine.instance.createAnalysisContext()
  ..sourceFactory = new SourceFactory(resolvers);

  Source source = new FileSource(resourceProvider.getFile(item.path));
  ChangeSet changeSet = new ChangeSet()..addedSource(source);
  context.applyChanges(changeSet);
  LibraryElement libElement = context.computeLibraryElement(source);

  CompilationUnit resolvedUnit =
      context.resolveCompilationUnit(source, libElement);

  var element = resolvedUnit.declaredElement;