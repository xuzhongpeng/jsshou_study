import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './translations.dart';
import '../provider/store/index.dart';

class Intl extends StatefulWidget {
  @override
  _MyInherit createState() => _MyInherit();
}

class _MyInherit extends State<Intl> {
  var data = 'hello flutter';
  Translations transle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    transle = Translations.of(context);
    print('main rebuild');
    return Scaffold(
      appBar: new AppBar(
        title: new Text(transle.text('title')),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(transle.text('first')),
          Text(transle.text('second')),
          Text(transle.text('third')),
          Text(transle.text('fourth')),
          Text(transle.text('fifth')),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Center(child: Icon(Icons.group_work)),
          onPressed: () {
            MyStore.value<LocalIntl>(context).change();
          }),
    );
  }
}
