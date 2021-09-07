import 'package:flutter/material.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Text("Middle Section"),
    );
  }
}
