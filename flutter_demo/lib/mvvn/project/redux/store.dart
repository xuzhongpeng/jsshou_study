import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import './item/item_reducer.dart';
import './item/item_state.dart';

final store = Store<ListState>(
  homePageReducer,
  initialState: ListState(),
  middleware: [
    thunkMiddleware2,
    thunkMiddleware1,
  ],
);

dynamic thunkMiddleware1<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is ThunkAction<State>) {
    dynamic ownAction = await action(store);
    return next(ownAction);
  } else if (action is CallableThunkAction<State>) {
    return action.call(store);
  } else {
    return next(action);
  }
}

//日志记录
dynamic thunkMiddleware2<State>(
  Store<State> store,
  dynamic action,
  NextDispatcher next,
) async {
  print("记录日志：调用了" + action.runtimeType.toString());
  return next(action);
}
