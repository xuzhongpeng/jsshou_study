import 'dart:async';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class Good {
  String name;
  int age;
  Good(this.name, this.age);
}

class _CounterPageState extends State<CounterPage> {
  Good person = Good('JSShou', 10);
  final StreamController<Good> _streamController =
      StreamController<Good>.broadcast();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamController.stream
        .transform(StreamTransformer.fromHandlers(handleData: (vm, sink) {
      print(vm.age);
      vm.age++;
      sink.add(vm);
    })).listen((onData) {
      print(onData.name);
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: Column(children: [
          StreamBuilder<Good>(
              // 监听Stream，每次值改变的时候，更新Text中的内容
              stream: _streamController.stream,
              initialData: person,
              builder: (BuildContext context, AsyncSnapshot<Good> snapshot) {
                return Text(
                    'You hit me:${snapshot.data.name.toString()} ${snapshot.data.age.toString()} times');
              }),
          StreamBuilder<Good>(
              // 监听Stream，每次值改变的时候，更新Text中的内容
              stream: _streamController.stream,
              initialData: person,
              builder: (BuildContext context, AsyncSnapshot<Good> snapshot) {
                return Text(
                    'You hit me:${snapshot.data.name.toString()} ${snapshot.data.age.toString()} times');
              }),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
          // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
          person.age++;
          person.name = person.name;
          _streamController.sink.add(person);
        },
      ),
    );
  }
}
