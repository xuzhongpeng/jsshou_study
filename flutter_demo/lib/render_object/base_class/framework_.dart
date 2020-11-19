import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class _Protected {
  const _Protected();
}

const _Protected protected = const _Protected();

abstract class WidgetX extends DiagnosticableTree {
  /// Initializes [key] for subclasses.
  const WidgetX({this.key});

  final Key key;

  @protected
  Element createElement();

  @override
  String toStringShort() {
    return key == null ? '$runtimeType' : '$runtimeType-$key';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.dense;
  }

  static bool canUpdate(WidgetX oldWidget, WidgetX newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType &&
        oldWidget.key == newWidget.key;
  }
}

abstract class StatelessXWidget extends WidgetX {
  /// Initializes [key] for subclasses.
  const StatelessXWidget({Key key}) : super(key: key);

  @override
  StatelessXElement createElement() => StatelessXElement(this);

  @protected
  Widget build(BuildContext context);
}

class StatelessXElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  StatelessXElement(dynamic widget) : super(widget);

  @override
  StatelessWidget get widget => super.widget;

  @override
  Widget build() => widget.build(this);

  @override
  void update(StatelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    // _dirty = true;
    rebuild();
  }
}

// abstract class ComponentElement extends Element {
//   /// Creates an element that uses the given widget as its configuration.
//   ComponentElement(Widget widget) : super(widget);

//   Element _child;

//   @override
//   void mount(Element parent, dynamic newSlot) {
//     super.mount(parent, newSlot);
//     assert(_child == null);
//     assert(_active);
//     _firstBuild();
//     assert(_child != null);
//   }

//   void _firstBuild() {
//     rebuild();
//   }

//   /// Calls the [StatelessWidget.build] method of the [StatelessWidget] object
//   /// (for stateless widgets) or the [State.build] method of the [State] object
//   /// (for stateful widgets) and then updates the widget tree.
//   ///
//   /// Called automatically during [mount] to generate the first build, and by
//   /// [rebuild] when the element needs updating.
//   @override
//   void performRebuild() {
//     if (!kReleaseMode && debugProfileBuildsEnabled)
//       Timeline.startSync('${widget.runtimeType}',  arguments: timelineWhitelistArguments);

//     assert(_debugSetAllowIgnoredCallsToMarkNeedsBuild(true));
//     Widget built;
//     try {
//       built = build();
//       debugWidgetBuilderValue(widget, built);
//     } catch (e, stack) {
//       built = ErrorWidget.builder(
//         _debugReportException(
//           ErrorDescription('building $this'),
//           e,
//           stack,
//           informationCollector: () sync* {
//             yield DiagnosticsDebugCreator(DebugCreator(this));
//           },
//         )
//       );
//     } finally {
//       // We delay marking the element as clean until after calling build() so
//       // that attempts to markNeedsBuild() during build() will be ignored.
//       _dirty = false;
//       assert(_debugSetAllowIgnoredCallsToMarkNeedsBuild(false));
//     }
//     try {
//       _child = updateChild(_child, built, slot);
//       assert(_child != null);
//     } catch (e, stack) {
//       built = ErrorWidget.builder(
//         _debugReportException(
//           ErrorDescription('building $this'),
//           e,
//           stack,
//           informationCollector: () sync* {
//             yield DiagnosticsDebugCreator(DebugCreator(this));
//           },
//         )
//       );
//       _child = updateChild(null, built, slot);
//     }

//     if (!kReleaseMode && debugProfileBuildsEnabled)
//       Timeline.finishSync();
//   }

//   /// Subclasses should override this function to actually call the appropriate
//   /// `build` function (e.g., [StatelessWidget.build] or [State.build]) for
//   /// their widget.
//   @protected
//   Widget build();

//   @override
//   void visitChildren(ElementVisitor visitor) {
//     if (_child != null)
//       visitor(_child);
//   }

//   @override
//   void forgetChild(Element child) {
//     assert(child == _child);
//     _child = null;
//   }
// }
