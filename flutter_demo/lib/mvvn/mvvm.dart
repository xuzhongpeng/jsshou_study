import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';
import 'package:http/src/io_client.dart';

import 'rxdart.dart';

class Mvvm extends StatefulWidget {
  @override
  _MvvmState createState() => _MvvmState();
}

class _MvvmState extends State<Mvvm> {
  GraphQLClient _client;
  final int nRepositories = 50;
  @override
  void initState() {
    super.initState();
    HttpClient _httpClient = HttpClient()
      ..findProxy = (uri) {
        return "PROXY 127.0.0.1:8888";
      };
    final cache = InMemoryCache();
    Client client = IOClient(_httpClient);

    HttpLink _httpLink =
        HttpLink(uri: 'http://192.168.1.72:5000/graphql', httpClient: client);

    final AuthLink _authLink = AuthLink(
      getToken: () async => '',
    );

    Link _link = _authLink.concat(_httpLink);
    _client = GraphQLClient(
      cache: cache,
      link: _link,
    );
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
                          fetchPolicy: FetchPolicy.noCache);
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

              setResult(result.data['createItem']);
            },
          ),
          FlatButton(child: Text("删除数据"), onPressed: () async {})
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => RxDartDemo()));
        },
      ),
    );
  }
}

class Item {
  int id;
  int itemRef;
  String name;
  bool show;

  Item({this.id, this.itemRef, this.name, this.show});

  Item.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id'] ?? '');
    itemRef = int.tryParse(json['item_ref'] ?? '');
    name = json['name'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_ref'] = this.itemRef;
    data['name'] = this.name;
    data['show'] = this.show;
    return data;
  }
}
