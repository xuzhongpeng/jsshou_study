import 'package:flutter_demo/mvvn/project/graphql/graphql_client.dart';
import './item_action.dart';
import 'package:graphql/client.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'item_state.dart';

/// 首页主接口
ThunkAction<ListState> getItems() {
  return (store) async {
    Items response;
    try {
      const String readRepositories = r'''
        query myqqq {
          items{
            id
            name
            show
          }
      }
      ''';
      final QueryOptions options = QueryOptions(
          documentNode: gql(readRepositories),
          variables: <String, dynamic>{},
          fetchPolicy: FetchPolicy.noCache);
      final QueryResult result = await GQClient.client.query(options);
      if (result.hasException) {
        print(result.exception.toString());
      }
      print(result.data);
      response = Items(List<Item>.from(
          result.data['items'].map((v) => Item.fromJson(v)).toList()));
    } catch (e) {
      print('>>>>>>>>>>>>>>>>>>>>>>>items${e.toString()}');
    }
    return Query(response??[]);
  };
}

ThunkAction<ListState> addItems() {
  return (store) async {
    Item response;
    try {
      const String readRepositories = r'''
                    mutation($item: ItemInput!) {
                      createItem(item: $item) {
                        id
                        item_ref
                        name
                        show
                      }
                    }
                  ''';
      final QueryOptions options = QueryOptions(
          documentNode: gql(readRepositories),
          variables: <String, dynamic>{
            "item": {
              "item_ref": "3333",
              "name": "33",
              "price": 1,
              "unit_num": 8
            }
          },
          fetchPolicy: FetchPolicy.noCache);
      final QueryResult result = await GQClient.client.query(options);
      response = Item.fromJson(result.data['createItem']);
    } catch (e) {
      print('>>>>>>>>>>>>>>>>>>>>>>>items${e.toString()}');
    }
    store.dispatch(AddItem(response));
  };
}

ThunkAction<Items> deleteItem(int id) {
  return (store) async {
    Item response;
    const String readRepositories = r'''
            mutation($id: Int!) {
              deleteItem(item_id: $id) {
                id
                item_ref
                name
                show
              }
            }
          ''';
    final QueryOptions options = QueryOptions(
        documentNode: gql(readRepositories),
        variables: <String, dynamic>{"id": id},
        fetchPolicy: FetchPolicy.networkOnly);
    print("ddd");
    final QueryResult result = await GQClient.client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }
    print("delete" + result.data.toString());
    response = Item.fromJson(result.data['deleteItem']);
    store.state.data.removeWhere((v)=>v.id==response.id);
    return Query(store.state);
    // store.dispatch(DeleteItem(response));
  };
}
