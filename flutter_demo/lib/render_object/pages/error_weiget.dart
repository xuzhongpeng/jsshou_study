import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorWidgetDemo extends StatefulWidget {
  @override
  _RenderObjectDemoState createState() => _RenderObjectDemoState();
}

class _RenderObjectDemoState extends State<ErrorWidgetDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  dynamic s;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ErrorWidgetDemo"),
        ),
        body: ErrorWidget("测试"));
  }
}
