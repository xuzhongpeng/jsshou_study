import 'package:flutter/material.dart';
import 'package:flutter_demo/mvvn/project/graphql/graphql_client.dart';
import 'package:flutter_demo/mvvn/project/redux/item/item_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart' as graphql;

class GraphqlFlutterDemo extends StatefulWidget {
  @override
  _GraphqlFlutterDemoState createState() => _GraphqlFlutterDemoState();
}

class _GraphqlFlutterDemoState extends State<GraphqlFlutterDemo> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GQClient.client),
      child: Scaffold(
        appBar: AppBar(
          title: Text("graphql_flutter"),
        ),
        body: Column(
          children: <Widget>[
            Query(
              options: QueryOptions(
                documentNode: gql(r"""
                  query myqqq {
                      items{
                        __typename
                        id
                        name
                        show
                      }
                  }
                """),
                fetchPolicy: graphql.FetchPolicy.cacheAndNetwork,
                variables: {},
                // pollInterval: 10,
              ),
              builder: (QueryResult result,
                  {VoidCallback refetch, FetchMore fetchMore}) {
                print('刷新了');
                if (result.data == null) {
                  return CircularProgressIndicator();
                }
                var items1 = List<Item>.from(
                    result.data['items'].map((v) => Item.fromJson(v)).toList());
                if (items1.length != items.length) {
                  items = items1;
                  refetch();
                }
                return Container(
                  height: 400,
                  color: Colors.grey,
                  child: ListView(
                    children: items != null
                        ? items
                            .map((i) => Row(
                                  children: <Widget>[
                                    Text(' *id:' + i?.id.toString()),
                                    Text(' *名字:' + i?.name.toString()),
                                    Text(' *show:' + i?.show.toString()),
                                    FlatButton(
                                      child: Text("删除"),
                                      onPressed: () {
                                        // store.dispatch(deleteItem(i.id));
                                      },
                                    )
                                  ],
                                ))
                            .toList()
                        : [Container()],
                  ),
                );
              },
            ),
            Mutation(
                options: MutationOptions(
                  documentNode: gql(r'''
                    mutation($item: ItemInput!) {
                      createItem(item: $item) {
                        __typename
                        id
                        name
                        show
                      }
                    }
                  '''),
                  update: (Cache cache, QueryResult result) {
                    setState(() {
                      items.add(Item.fromJson(result.data['createItem']));
                    });
                  },
                  onCompleted: (dynamic resultData) {
                    print("result" + resultData.toString());
                  },
                ),
                builder: (
                  RunMutation runMutation,
                  QueryResult result,
                ) {
                  return FlatButton(
                    child: Text("添加数据"),
                    onPressed: () => runMutation({
                      "item": {
                        "item_ref": "3333",
                        "name": "33",
                        "price": 1,
                        "unit_num": 8
                      }
                    }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
