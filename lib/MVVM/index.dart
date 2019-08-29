// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import './mvvm/MvvmWidget.dart';
import './mvvm/stream.dart';
import './mvvm/store.dart';
import 'dart:collection';

class Person {
  String name;
  Person(this.name);
}

class MvvmTest extends MvvmWidget<Person> {
  // Person person = Person('xx');

  // MvvmTest():super<Person>(state:Person);
  @override
  getMvvmState() {
    Person p = Person('xxx');

    return p;
  }

  TextEditingController _controller;

  @override
  Widget build(BuildContext context, store) {
    var person = store.state;
    _controller = new TextEditingController(text: person.name);

    return Scaffold(
        appBar: new AppBar(
          title: new Text(person.name),
        ),
        body: Column(
          children: <Widget>[
            Text(person.name),
            new TextField(
              controller: _controller,
              decoration: new InputDecoration(
                hintText: 'Type something',
              ),
              autofocus: true,
              onChanged: (text) {
                person.name = text;
                // notify(context, person);
                store.change();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // 每次点击按钮，更加_counter的值，同时通过Sink将它发送给Stream；
            // 每注入一个值，都会引起StreamBuilder的监听，StreamBuilder重建并刷新counter
          },
        ));
  }
}
