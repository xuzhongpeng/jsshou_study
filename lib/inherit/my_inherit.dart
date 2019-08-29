import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInherit extends StatefulWidget {
  @override
  _MyInherit createState() => _MyInherit();
}

class _MyInherit extends State<MyInherit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('inherit'),
        ),
        body: MyWelcomeInfo(
          title: 'hello flutter',
          child: Center(
            child: Center(
              child: MyNestedChild(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Center(child: Icon(Icons.group_work)),
            onPressed: () {
              var a = context.inheritFromWidgetOfExactType(MyWelcomeInfo);
              print(a);
            }));
  }
}

class MyWelcomeInfo extends InheritedWidget {
  MyWelcomeInfo({Key key, this.title, Widget child})
      : super(key: key, child: child);

  String title;

  @override
  bool updateShouldNotify(MyWelcomeInfo oldWidget) {
    return oldWidget.title != title;
  }
}

class MyNestedChild extends StatelessWidget {
  @override
  build(BuildContext context) {
    final MyWelcomeInfo widget =
        context.inheritFromWidgetOfExactType(MyWelcomeInfo);
    return RaisedButton(
      child: Text(widget.title),
      onPressed: () {
        MyWelcomeInfo a = context.inheritFromWidgetOfExactType(MyWelcomeInfo);
        a.title = '2222';
        print(a);
      },
    );
  }
}
