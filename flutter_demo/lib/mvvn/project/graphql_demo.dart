import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/item/item_state.dart';
import 'redux/item/item_thunk_action.dart';
import 'redux/store.dart';

class GraphqlDemo extends StatefulWidget {
  @override
  _GraphqlDemoState createState() => _GraphqlDemoState();
}

class _GraphqlDemoState extends State<GraphqlDemo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.dispatch(getItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    print('来了老弟');
    return new StoreProvider<ListState>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: Text('graphql'),
        ),
        body: Column(
          children: <Widget>[
            new StoreConnector<ListState, Items>(
                converter: (store) => store.state?.list != null
                    ? store.state.list
                    : Items([]),
                builder: (context, Items items) {
                  return Container(
                    height: 400,
                    color: Colors.grey,
                    child: ListView(
                      children: items != null
                          ? items.data
                              .map((i) => Row(
                                    children: <Widget>[
                                      Text(' *id:' + i?.id.toString()),
                                      Text(' *名字:' + i?.name.toString()),
                                      Text(' *show:' + i?.show.toString()),
                                      FlatButton(
                                        child: Text("删除"),
                                        onPressed: () {
                                          store.dispatch(deleteItem(i.id));
                                        },
                                      )
                                    ],
                                  ))
                              .toList()
                          : [Container()],
                    ),
                  );
                }),
            FlatButton(
              child: Text("添加数据"),
              onPressed: () {
                store.dispatch(addItems());
              },
            )
          ],
        ),
      ),
    );
  }
}
