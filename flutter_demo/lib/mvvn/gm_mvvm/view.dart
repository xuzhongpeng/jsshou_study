import 'package:flutter/material.dart';

import 'view_model.dart';

abstract class View<TViewModel extends ViewModel>
    extends ViewBase<TViewModel, ViewContext<TViewModel>> {
  /// View
  View(TViewModel model)
      : assert(model != null),
        super(ViewContext<TViewModel>(model));
}

abstract class ViewBase<TViewModel extends ViewModel,
    TViewContext extends ViewContext<TViewModel>> extends ViewWidget {
  /// ViewBase
  ViewBase(this._context);

  final TViewContext _context;

  ///
  /// 视图模型 [ViewModel]
  TViewModel get $Model {
    _context.model.data.viewBase = this;
    return _context.model;
  }

  ///
  /// 视图上下文 [ViewContext]
  TViewContext get $ => _context;

  @override
  void _buildBefore(BuildContext context) {
    // _context?._viewInit(context);
    init(context);
  }

  @override
  void _buildAfter(BuildContext context) {
    ready(context);
    // _context?._viewReady(context);
  }

  @override
  void _dispose() {
    // _context?._dispose();
  }

  /// dispose
  @protected
  void dispose() {}

  /// init
  @protected
  void init(BuildContext context) {}

  /// ready
  @protected
  void ready(BuildContext context) {}
}

class ViewContext<TViewModel extends ViewModelBase> {
  //   extends _ViewContextBase<TViewModel>
  //   with
  //       ViewContextWatchHelperMixin,
  //       ViewContextLogicalHelperMixin,
  //       ViewContextBuilderHelperMixin,
  //       ViewContextAdaptorHelperMixin {
  // /// ViewContext
  ViewContext(this.model);
  TViewModel model;
}

abstract class ViewWidget extends StatefulWidget {
  final _state = _ViewWidgetState();

  /// build
  @protected
  Widget build(BuildContext context);

  void _buildBefore(BuildContext context);
  void _buildAfter(BuildContext context);
  void _dispose();

  /// setState
  @protected
  void setState(VoidCallback fn) => _state._setState(fn);

  @override
  State<StatefulWidget> createState() => _state;
}

class _ViewWidgetState extends State<ViewWidget> {
  @override
  Widget build(BuildContext context) {
    widget._buildBefore(context);
    var _ = widget.build(context);
    widget._buildAfter(context);
    return _;
  }

  void _setState(VoidCallback fn) => setState(fn);

  @override
  void dispose() {
    super.dispose();
    widget._dispose();
  }
}
