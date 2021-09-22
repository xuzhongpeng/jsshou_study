import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_demo/mvvm/project/graphql_demo.dart';
// import 'package:flutter_demo/mvvm/mvvm.dart';
import 'package:flutter_demo/platform/platform.dart';
import 'package:flutter_demo/render_object/render_object.dart';
import './provider/index.dart';
import './provider/store/index.dart';
import './redux/index.dart';
import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import './stream/stream_test.dart';
import './inherit/my_inherit.dart';
import './charts/charts_test.dart';
import 'package:flutter_demo/canvas/canvas_test.dart';
import './AnimatedBuilder/index.dart';
import './notification/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './intl/intl.dart';
import './intl/translations.dart';
import './single_page/back.dart';
import 'components/menu_list.dart';
// import 'package:git_hooks/git_hooks.dart';

main() async {
  // GitHooks.init();
  runApp(new StartPage());
}

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartPageState();
  }
}

class StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, WidgetBuilder> routes = {
    'provider': (_) => MyProvider(),
    'stream': (_) => CounterPage(),
    'inherit': (_) => MyInherit(),
    'charts': (_) => ChartsTest(),
    '五子棋': (_) => CustomPaintRoute(),
    'AnimatedBuilder': (_) => MyAnimatedBuilder(),
    'notification': (_) => NotificationRoute(),
    'Intl': (_) => Intl(),
    'platformView': (_) => UIActivityIndicator(),
    "Widget、Element、RenderObject": (_) => RenderObjectDemo(),
    "redux": (_) => ReduxPage(),
    "物理返回测试": (_) => BackPage()
  };
  @override
  Widget build(BuildContext context) {
    print('执行');
    //
    return MyStore.init(
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
            navigatorObservers: [OwnNavigatorObserver()],
            home: Builder(builder: (context) {
              return MainPage(routes);
            }));
      }),
    );
  }
}

class MainPage extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  MainPage(this.routes);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: MenuList(
        routes: routes,
      ),
    );
  }
}

class OwnNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print("wow， navigator has popped " + route.settings.name.toString());
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print("wow, navigator has pushed " + route.settings.name.toString());
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    print("wow, navigator has remove " + route.settings.name.toString());
  }
}
