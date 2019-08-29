import 'package:flutter/material.dart';
import './provider/index.dart';
import './provider/store/index.dart';
import './redux/index.dart';
import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import './stream/stream_test.dart';
import './inherit/my_inherit.dart';
import './MVVM/index.dart';
import './charts/charts_test.dart';
import 'package:my_test/canvas/canvas_test.dart';

void main() {
  runApp(StartPage());
}

class StartPage extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {
    'provider': (_) => MyProvider(),
    'stream': (_) => CounterPage(),
    'inherit': (_) => MyInherit(),
    'mvvm': (_) => MvvmTest(),
    'charts': (_) => ChartsTest(),
    '五子棋': (_) => CustomPaintRoute()
  };
  @override
  Widget build(BuildContext context) {
    final store = new Store<int>(counterReducer, initialState: 0);
    return MyStore.init(
      context: context,
      child: MaterialApp(
          routes: routes,
          home: Builder(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.arrow_back),
                title: Text('FirstPage'),
              ),
              body: Center(
                child: ListView(
                  children: [
                    ...routes.keys.map((route) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(route);
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[500]))),
                          child: Center(
                            child: Text(route),
                          ),
                        ),
                      );
                    }).toList(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return new FlutterReduxApp(
                              store: store,
                            );
                          },
                        ));
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[500]))),
                        child: Center(
                          child: Text('redux'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
