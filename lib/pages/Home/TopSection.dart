import 'package:flutter/material.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key key}) : super(key: key);

  @override
  _TopSectionState createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  Container counterBox(String title, {int count = 0}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(3, 2),
          blurRadius: 5,
          spreadRadius: 0.5,
        )
      ]),
      child: Stack(
        children: [
          Text("$title"),
          Center(
            child: Text(
              "$count",
              style: TextStyle(fontSize: 36),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        counterBox("Confirmed"),
        counterBox("Active"),
        counterBox("Recovered"),
        counterBox("Decreased"),
      ],
    );
  }
}
