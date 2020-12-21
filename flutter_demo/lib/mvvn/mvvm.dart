import 'package:flutter/material.dart';
import 'package:flutter_demo/components/menu_list.dart';
import 'package:flutter_demo/mvvn/project/apollo/graphql_flutter_demo.dart';
import 'package:flutter_demo/mvvn/project/graphql/graphql_client.dart';
import 'package:flutter_demo/mvvn/project/graphql_demo.dart';
import 'package:graphql/client.dart';
import 'project/redux/item/item_state.dart';

class Mvvm extends StatefulWidget {
  @override
  _MvvmState createState() => _MvvmState();
}

class _MvvmState extends State<Mvvm> {
  @override
  void initState() {
    super.initState();
    GQClient.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("各种demo"),
      ),
      body: MenuList(
        routes: {
          "redux": (_) => GraphqlDemo(),
          "graphql_flutter": (_) => GraphqlFlutterDemo()
        },
      ),
    );
  }
}

class _MvvmState1 extends State<Mvvm> {
  GraphQLClient _client;
  final int nRepositories = 50;
  @override
  void initState() {
    super.initState();
    _client = GQClient.init();
  }

  List<Item> result = [];
  setResult(List list) {
    if (list == null) return;
    setState(() {
      result = list.map((f) => Item.fromJson(f)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mvvm+graphql'),
      ),
      body: ListView(
        children: <Widget>[
          ...result.map((r) => Column(
                children: <Widget>[
                  Text(r.name),
                  FlatButton(
                    child: Text("delete"),
                    onPressed: () async {
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
                          variables: <String, dynamic>{"id": r.id},
                          fetchPolicy: FetchPolicy.cacheOnly);
                      print("ddd");
                      final QueryResult result = await _client.query(options);

                      if (result.hasException) {
                        print(result.exception.toString());
                      }
                      print("delete" + result.data.toString());
                      if (result.data != null)
                        setResult(result.data['deleteItem']);
                    },
                  )
                ],
              )),
          FlatButton(
              onPressed: () async {
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
                    variables: <String, dynamic>{
                      'nRepositories': nRepositories,
                    },
                    fetchPolicy: FetchPolicy.noCache);
                print("ddd");
                final QueryResult result = await _client.query(options);

                if (result.hasException) {
                  print(result.exception.toString());
                }
                print(result.data);
                setResult(result.data['items']);
              },
              child: Text("获取数据")),
          FlatButton(
            child: Text("添加数据"),
            onPressed: () async {
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
                      "name": "88888",
                      "price": 88888,
                      "unit_num": 8
                    }
                  },
                  fetchPolicy: FetchPolicy.noCache);
              print("ddd");
              final QueryResult result = await _client.query(options);

              if (result.hasException) {
                print(result.exception.toString());
              }

              // setResult(result.data['createItem']);
            },
          ),
          FlatButton(child: Text("删除数据"), onPressed: () async {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => GraphqlDemo()));
        },
      ),
    );
  }
}
