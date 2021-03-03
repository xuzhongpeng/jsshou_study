import 'package:flutter/material.dart';

class Tools {
  print(String test) {
    print(test);
  }
}

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      child: SizedBox(width: 100, height: 100),
      color: Colors.red,
    );
  }
}
