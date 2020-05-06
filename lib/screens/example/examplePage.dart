import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  final Color color;
  ExampleWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
