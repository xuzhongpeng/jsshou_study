import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'view.dart';
import 'view_model.dart';

class DemoViewModel extends ViewModel {
  @override
  setData() {
    return ViewModelMap({"title": "12345"});
  }
}

class MvvMDemo extends View<DemoViewModel> {
  MvvMDemo(this.appContext) : super(DemoViewModel());
  BuildContext appContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text($Model.data['title']),
      ),
      body: GestureDetector(
          onTap: () {
            $Model.data['title'] = '333';
          },
          child: Text("demo")),
    );
  }
}
