import 'package:apicall/actions/ActionHome.dart';
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
          // ElevatedButton(
          //     onPressed: () async {
          //       final temp = await ActionHome.fetchUser();
          //       setState(() {
          //         dataFromApi = temp;
          //       });
          //     },
          //     child: Text("GET USER")),
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
