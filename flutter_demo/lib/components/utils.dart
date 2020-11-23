import 'package:flutter/material.dart';

import './jnStatelessWidget.dart';

class Utils {
  static push(BuildContext context, JnStatelessWidget widget) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => widget,
        settings: RouteSettings(name: widget.pageName)));
  }
}
