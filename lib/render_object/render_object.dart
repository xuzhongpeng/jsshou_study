import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/render_object/pages/error_weiget.dart';

class RenderObjectDemo extends StatefulWidget {
  @override
  _RenderObjectDemoState createState() => _RenderObjectDemoState();
}

class _RenderObjectDemoState extends State<RenderObjectDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("探索Widget、Element、RenderObject关系"),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ErrorWidgetDemo()));
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[500]))),
              child: Center(
                child: Text('ErrorWidget'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
