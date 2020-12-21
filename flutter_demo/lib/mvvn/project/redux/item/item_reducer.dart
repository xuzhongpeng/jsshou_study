import './item_action.dart';
import 'package:redux/redux.dart';

import 'item_state.dart';

final homePageReducer = combineReducers<ListState>([
  TypedReducer<ListState, Query>(_getItemOverview),
  TypedReducer<ListState, AddItem>(_addItemOverview),
  // TypedReducer<ListState, DeleteItem>(_deleteItemOverview),
]);

/// 获取item
ListState _getItemOverview(ListState state, Query action) {
  print(action.data);
  dynamic data = action.data;
  // a.forEach((type) {
  if (data.runtimeType == Items) {
    state.list = data;
  }
  // });
  return state;
}

/// 添加item
ListState _addItemOverview(ListState itemState, AddItem action) {
  return itemState;
}
// /// 删除item
// ListState _deleteItemOverview(ListState itemState, DeleteItem action) {
//   itemState.list.removeWhere((i)=>i.id==action.item.id);
//   return ListState(itemState.list);
// }
