import 'package:flutter/material.dart';

class BackPage extends StatefulWidget {
  @override
  _BackPageState createState() => _BackPageState();
}

class _BackPageState extends State<BackPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("返回测试"),
    ));
  }
}

class _Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<_Page1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Page1"),
    ));
  }
}
