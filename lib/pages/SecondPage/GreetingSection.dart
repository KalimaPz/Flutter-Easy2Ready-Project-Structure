import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Text("Greeting!!"),
    );
  }
}
