import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

// One simple action: Increment
enum Actions { Increment, G }

///定义state
class DemoState {
  int count;
  String title;
  DemoState(this.count, this.title);
}

///定义action封装，可传递参数
class Dispatch {
  final Actions actions;
  final dynamic arguments;
  Dispatch(this.actions, {this.arguments});
}

//定义reducer
DemoState counterReducer(DemoState state, dispatch) {
  return dispatch is DemoState ? dispatch : state;
}

class ReduxPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return FlutterReduxApp(
      store: new Store<DemoState>(counterReducer,
          middleware: [thunkMiddleware], initialState: DemoState(0, 'redux')),
    );
  }
}

class FlutterReduxApp extends StatelessWidget {
  final Store<DemoState> store;

  FlutterReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('redux build 重建了');
    return new StoreProvider<DemoState>(
      store: store,
      child: new StoreConnector<DemoState, DemoState>(
        converter: (store) => store.state,
        builder: (context, count) {
          print('redux text重建了');
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(count.title),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    count.count.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
            floatingActionButton: new StoreConnector<DemoState, VoidCallback>(
              converter: (store) {
                ThunkAction<DemoState> waitAndDispatch(Dispatch secondsToWait) {
                  return (Store<DemoState> store) async {
                    final searchResults = await new Future.delayed(
                      new Duration(seconds: 1),
                      () => secondsToWait.arguments,
                    );

                    store.dispatch(searchResults);
                  };
                }

                return () => store.dispatch(
                    waitAndDispatch(Dispatch(Actions.Increment, arguments: DemoState(2,'滚滚滚'))));
                // store.dispatch(Dispatch(Actions.Increment, arguments: 2));
              },
              builder: (context, callback) {
                return new FloatingActionButton(
                  onPressed: callback,
                  child: new Icon(Icons.add),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
