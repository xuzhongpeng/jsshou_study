

import 'item_state.dart';

// 获取item
class Query<T>{
  T data;
  Query(this.data);
}
//添加item
class AddItem{
  Item item;

  AddItem(this.item);
}
//删除item
class DeleteItem{
  Item item;

  DeleteItem(this.item);
}