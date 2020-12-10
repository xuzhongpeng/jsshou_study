import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rxdart"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text("xx"),
            onPressed: () {
              Stream.fromIterable([1, 2, 3])
                  .throttleTime(Duration(milliseconds: 100))
                  .listen(print);
            },
          )
        ],
      ),
    );
  }
}
