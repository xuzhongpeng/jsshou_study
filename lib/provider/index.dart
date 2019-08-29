/*
 * @Author: xuzhongpeng
 * @email: xuzhongpeng@foxmail.com
 * @Date: 2019-08-07 16:45:09
 * @LastEditors: xuzhongpeng
 * @LastEditTime: 2019-08-21 15:42:13
 */
import 'package:flutter/material.dart';
import 'package:my_test/provider/store/index.dart';
import './store/index.dart' show MyStore, Counter, UserModel;
import 'package:provider/provider.dart' show ChangeNotifierProvider;

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('根部重建: $context');
    return FirstPage();
  }
}

class FirstPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  int count = 0;
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
            ChangeNotifierProvider.value(
              value: Counter(),
              child: RaisedButton(
                child: Text('+'),
                onPressed: () {
                  count++;
                },
              ),
            ),
            MyStore.connect<Counter>(builder: (context, snapshot, child) {
              return RaisedButton(
                child: Text('+'),
                onPressed: () {
                  snapshot.increment();
                },
              );
            }),
            MyStore.connect<Counter>(builder: (context, snapshot, child) {
              print('first page counter widget rebuild');
              return Text('${snapshot.count}');
            }),
            MyStore.connect<Counter>(builder: (context, snapshot, child) {
              return RaisedButton(
                child: Text('-'),
                onPressed: () {
                  snapshot.decrement();
                },
              );
            }),
            MyStore.connect<UserModel>(builder: (context, snapshot, child) {
              print('first page name Widget rebuild');
              return Text('${MyStore.value<UserModel>(context).name}');
            }),
            TextField(
              controller: controller,
            ),
            MyStore.connect<UserModel>(builder: (context, snapshot, child) {
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
  @override
  Widget build(BuildContext context) {
    print('second page rebuild');
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
                MyStore.value<Counter>(context).increment();
              },
            ),
            Builder(
              builder: (context) {
                print('second page counter widget rebuild');
                return Text(
                    'second page: ${MyStore.value<Counter>(context).count}');
              },
            ),
            RaisedButton(
              child: Text('-'),
              onPressed: () {
                MyStore.value<Counter>(context).increment();
              },
            ),
            Text(aa.toString()),
            RaisedButton(
              child: Text('go'),
              onPressed: () {
                setState(() {
                  aa++;
                });
              },
            )
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
