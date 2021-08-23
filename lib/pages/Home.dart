import 'package:apicall/actions/ActionHome.dart';
import 'package:apicall/actions/ActionPostUser.dart';
import 'package:apicall/pages/SecondPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dataFromApi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () async {
                final res = await ActionPostUser.postUserData(payload: {
                  "id": "10",
                  "name": "Donnukrit",
                  "profileImg": "google.com"
                });
                print(res.toString());
              },
              child: Text("POST USER")),
          ElevatedButton(
              onPressed: () async {
                await ActionHome.getUser();
              },
              child: Text("GET USER")),
          ElevatedButton(
              onPressed: () {
                ActionHome.getOrder();
              },
              child: Text("GET Order")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ));
              },
              child: Text("Go Second Page")),
        ],
      ),
    );
  }
}
// https://stackoverflow.com/questions/56201074/how-to-encode-and-decode-base64-and-base64url-in-flutter-dart