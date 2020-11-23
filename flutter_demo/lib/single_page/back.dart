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
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("page1"),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => _Page1())),
          ),
          RaisedButton(
            child: Text("page2"),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => _Page2())),
          )
        ],
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Page1"),
    ));
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
        title: Text("Page2"),
      )),
    );
  }
}
