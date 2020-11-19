// import 'package:flutter/material.dart' show BuildContext;
// import 'package:provider/provider.dart'
//     show ChangeNotifierProvider, MultiProvider, Consumer, Provider;
import 'package:flutter/material.dart';

import '../model/index.dart' show Counter, UserModel;
export '../model/index.dart';
import 'package:scoped_model/scoped_model.dart';

class MyStoreScoped {
  //  我们将会在main.dart中runAPP实例化init
  static init({context, child}) {
    return ScopedModel<Counter>(
      model: Counter(),
      child: ScopedModel<UserModel>(
        model: UserModel(),
        child: child,
      ),
    );
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T extends Model>(context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  /// 通过Consumer获取状态数据
  static ScopedModelDescendant connect<T extends Model>({@required builder}) {
    return ScopedModelDescendant<T>(builder: builder);
  }
}
