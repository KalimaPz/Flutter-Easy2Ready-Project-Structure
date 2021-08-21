import 'package:apicall/actions/ActionSecondPage.dart';
import 'package:apicall/models/user.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<User> userData;
  initialAction() async {
    userData = await ActionSecondPage.fetchUser();
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text("${userData[index].name}"),
                Text("${userData[index].phone}"),
              ],
            ),
          );
        },
      )),
    );
  }
}
