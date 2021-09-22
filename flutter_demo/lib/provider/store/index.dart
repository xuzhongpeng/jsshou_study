import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_demo/provider/model/index.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer, Provider;
import '../model/index.dart' show Counter, UserModel;
export '../model/index.dart';
export 'package:provider/provider.dart';

class MyStore {
  // static BuildContext context;
  // static BuildContext widgetCtx;

  //  我们将会在main.dart中runAPP实例化init
  static init({context, child}) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(builder: (_) => Counter()),
        // ChangeNotifierProvider(builder: (_) => UserModel()),
        // ChangeNotifierProvider(
        //   builder: (_) => LocalIntl(),
        // )
      ],
      child: child,
    );
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T>(context) {
    return Provider.of<T>(context);
  }

  /// 通过Consumer获取状态数据
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
