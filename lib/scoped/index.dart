/*
 * @Author: xuzhongpeng
 * @email: xuzhongpeng@foxmail.com
 * @Date: 2019-08-07 16:45:09
 * @LastEditors: xuzhongpeng
 * @LastEditTime: 2019-09-10 11:00:59
 */
import 'package:flutter/material.dart';
// import 'package:flutter_demo/provider/store/index.dart';
import './store/index.dart' show MyStoreScoped, Counter, UserModel;
// import 'package:provider/provider.dart' show ChangeNotifierProvider;

class MyScoped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('根部重建: $context');
    return FirstPage();
  }
}

class FirstPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  int count = 0;
  Counter model;
  @override
  Widget build(BuildContext context) {
    print('first page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //   RaisedButton(
            //     child: Text('+'),
            //     onPressed: () {
            //       count++;
            //     },
            // ),
            MyStoreScoped.connect<Counter>(builder: (context, child, snapshot) {
              return RaisedButton(
                child: Text('+'),
                onPressed: () {
                  snapshot.increment();
                },
              );
            }),
            MyStoreScoped.connect<Counter>(builder: (context, child, snapshot) {
              print('first page counter widget rebuild');
              return Text('${snapshot.count}');
            }),
            MyStoreScoped.connect<Counter>(builder: (context, child, snapshot) {
              return RaisedButton(
                child: Text('-'),
                onPressed: () {
                  snapshot.decrement();
                },
              );
            }),
            MyStoreScoped.connect<UserModel>(
                builder: (context, child, snapshot) {
              print('first page name Widget rebuild');
              return Text('${MyStoreScoped.value<UserModel>(context).name}');
            }),
            TextField(
              controller: controller,
            ),
            MyStoreScoped.connect<UserModel>(
                builder: (context, child, snapshot) {
              return RaisedButton(
                child: Text('change name'),
                onPressed: () {
                  snapshot.setName(controller.text);
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.group_work)),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) {
                    return new SecondPage();
                  },
                  transitionsBuilder:
                      (___, Animation<double> animation, ____, Widget child) {
                    return FadeTransition(
                      opacity: animation,
                      child: RotationTransition(
                        turns: Tween<double>(begin: 0.5, end: 1.0)
                            .animate(animation),
                        child: child,
                      ),
                    );
                  }));
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage();
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  int aa = 0;
  var model;
  @override
  Widget build(BuildContext context) {
    print('second page rebuild');
    Counter model = MyStoreScoped.value<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('+'),
              onPressed: () {
                model.increment();
              },
            ),
            Builder(
              builder: (context) {
                print('second page counter widget rebuild');
                return Text('second page: ${model.count}');
              },
            ),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                model.decrement();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class Test extends StatefulWidget {
//   Test();
//   State<StatefulWidget> createState() => _Test();
// }

// class _Test extends State<Test> {
//   @override
//   void initState() {
//     // TODO: implement setState
//     super.initState();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {}
// }
