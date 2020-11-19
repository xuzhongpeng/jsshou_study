import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class MyAnimatedBuilder extends StatefulWidget {
  @override
  _MyAnimatedBuilder createState() => _MyAnimatedBuilder();
}

class _MyAnimatedBuilder extends State<MyAnimatedBuilder> {
  MyModel model = MyModel();

  @override
  Widget build(BuildContext context) {
    print('animated rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: model,
            builder: (context, child) {
              print('builder rebuild');
              return new Column(children: [
                Builder(builder: (context) {
                  return RaisedButton(
                    child: Text('-'),
                    onPressed: () {
                      model.decrement();
                    },
                  );
                }),
                Text(model.count.toString()),
                RaisedButton(
                  child: Text('+'),
                  onPressed: () {
                    model.increment();
                  },
                ),
              ]);
            }),
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  int count = 0;
  increment() {
    this.count++;
    notifyListeners();
  }

  decrement() {
    this.count--;
    notifyListeners();
  }
}
