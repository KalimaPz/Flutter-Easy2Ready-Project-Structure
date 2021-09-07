import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/actions/ActionSecondPage.dart';
import 'package:flutter_project_boiler_plate/components/MyCustomTopicHeader.dart';
import 'package:flutter_project_boiler_plate/pages/SecondPage/GoodbyeSection.dart';
import 'package:flutter_project_boiler_plate/pages/SecondPage/GreetingSection.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: ListView(
        children: [
          MyCustomTopicHeader(
            title: "My Header",
          ),
          GreetingSection(),
          GoodbyeSection(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => ActionSecondPage.action1(),
                    child: Text("Action 1")),
                TextButton(
                    onPressed: () => ActionSecondPage.action2(),
                    child: Text("Action 2")),
                TextButton(
                    onPressed: () => ActionSecondPage.action3(),
                    child: Text("Action 3")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
