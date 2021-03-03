import 'ast_tools.dart';
import 'package:flutter/material.dart';

void main(arguments) {
  Tools tools = Tools();
  tools.print("👍🏻");
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Input(),
    );
  }
}

