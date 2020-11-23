import 'package:flutter/material.dart';

import './jnStatelessWidget.dart';
class Utils{
  static push(Context context,JnStatelessWidget widget){
    Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => widget));
  }
}