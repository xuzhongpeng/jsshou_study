import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInherit extends StatefulWidget {
  @override
  _MyInherit createState() => _MyInherit();
}

class _MyInherit extends State<MyInherit> {
  var data = 'hello flutter';
  var dd = MyNestedChild();
  @override
  Widget build(BuildContext context) {
    print('main rebuild');
    return Scaffold(
        appBar: new AppBar(
          title: new Text('inherit'),
        ),
        body: MyWelcomeInfo(
          title: data,
          child: Center(
            child: Center(
              child: dd,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Center(child: Icon(Icons.group_work)),
            onPressed: () {
              setState(() {
                data = 'this changed';
              });
            }));
  }
}

class MyWelcomeInfo extends InheritedWidget {
  MyWelcomeInfo({Key key,  this.title,  @required Widget child})
      : super(key: key, child: child);

  String title;

  @override
  bool updateShouldNotify(MyWelcomeInfo oldWidget) {
    print('update');
    return oldWidget.title != title;
  }
}

class MyNestedChild extends StatelessWidget {
  @override
  build(BuildContext context) {
    final MyWelcomeInfo widget =
        context.dependOnInheritedWidgetOfExactType<MyWelcomeInfo>();
    print('child rebuild');
    return RaisedButton(
      child: Text(widget.title ?? ""),
      onPressed: () {
        // widget.title = '2222';
        // print(widget.title);
      },
    );
  }
}
