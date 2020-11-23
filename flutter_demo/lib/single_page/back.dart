import 'package:flutter/material.dart';
import '../componets/jnStatelessWidget.dart';

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
            onPressed: () {
              print(_Page1().pageName);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => _Page1()));
            },
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

class _Page1 extends StatelessWidget implements JnStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Page1"),
    ));
  }

  @override
  String pageName = "page1";
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        var _route = ModalRoute.of(context);
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
        title: Text("Page2"),
      )),
    );
  }
}
