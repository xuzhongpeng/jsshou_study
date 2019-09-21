import 'dart:async';

import 'package:flutter/material.dart';
import './provider/index.dart';
import './provider/store/index.dart';
import './redux/index.dart';
import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import './stream/stream_test.dart';
import './inherit/my_inherit.dart';
import './charts/charts_test.dart';
import 'package:flutter_demo/canvas/canvas_test.dart';
import './scoped/index.dart';
import './scoped/store/index.dart';
import './AnimatedBuilder/index.dart';
import './notification/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './intl/intl.dart';
import './intl/translations.dart';

main() async {
  runApp(new StartPage());
}

class StartPage extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {
    'provider': (_) => MyProvider(),
    'stream': (_) => CounterPage(),
    'inherit': (_) => MyInherit(),
    "scoped": (_) => MyScoped(),
    'charts': (_) => ChartsTest(),
    '五子棋': (_) => CustomPaintRoute(),
    'AnimatedBuilder': (_) => MyAnimatedBuilder(),
    'notification': (_) => NotificationRoute(),
    'Intl': (_) => Intl()
  };
  @override
  Widget build(BuildContext context) {
    final store = new Store<int>(counterReducer, initialState: 0);
    return MyStore.init(
      context: context,
      child: MyStoreScoped.init(
        context: context,
        child: Builder(builder: (context) {
          return MaterialApp(
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('zh', 'CH'),
                // ... other locales the app supports
              ],
              localizationsDelegates: [
                // ... app-specific localization delegate[s] here
                SpecificLocalizationDelegate(
                    MyStore.value<LocalIntl>(context).locale),
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              routes: routes,
              builder: (context, child) {
                print('main rebuild');
                return child;
              },
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
                                        bottom: BorderSide(
                                            color: Colors.grey[500]))),
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
                                      bottom:
                                          BorderSide(color: Colors.grey[500]))),
                              child: Center(
                                child: Text('redux'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                        child: Center(child: Icon(Icons.group_work)),
                        onPressed: () {}));
              }));
        }),
      ),
    );
  }
}
