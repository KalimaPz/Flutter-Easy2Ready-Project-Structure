import 'package:flutter/material.dart';

class MyCustomTopicHeader extends StatelessWidget {
  final String title;
  const MyCustomTopicHeader({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title),
    );
  }
}
