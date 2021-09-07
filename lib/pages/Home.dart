import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/actions/ActionHome.dart';
import 'package:flutter_project_boiler_plate/pages/Home/FooterSection.dart';
import 'package:flutter_project_boiler_plate/pages/Home/MiddleSection.dart';
import 'package:flutter_project_boiler_plate/pages/Home/TopSection.dart';
import 'package:flutter_project_boiler_plate/pages/SecondPage.dart';
import 'package:flutter_project_boiler_plate/store/counter_provider.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Boilerplate"),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          TopSection(),
          MiddleSection(),
          FooterSection(),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ));
              },
              child: Text("GO TO SECOND PAGE")),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => ActionHome.action1(),
                    child: Text("Action 1")),
                TextButton(
                    onPressed: () => ActionHome.action2(),
                    child: Text("Action 2")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
