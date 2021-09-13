import 'package:flutter/material.dart';
import 'package:flutter_project_boiler_plate/actions/ActionHome.dart';
import 'package:flutter_project_boiler_plate/pages/ChartView.dart';
import 'package:flutter_project_boiler_plate/pages/Home/TopSection.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    ActionHome.getTodayCases();
  }

  InkWell drawerSelector(String title, {@required VoidCallback callBack}) {
    return InkWell(
      onTap: callBack,
      child: ListTile(
        leading: Text("Chart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(child: Text("Application")),
              drawerSelector("Chart View",
                  callBack: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChartView(),
                      )))
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              // flexibleSpace: Image.network(
              //   "https://squaxinisland.org/wp/wp-content/uploads/2020/12/Vaccines-Shields.jpg",
              //   fit: BoxFit.cover,
              // ),
              title: Text(
                "Covid-19 Tracker",
                style: TextStyle(color: Colors.black),
              ),
              // expandedHeight: 160,
            ),
            SliverToBoxAdapter(
              child: MediaQuery.removePadding(
                  removeTop: true, context: context, child: TopSection()),
            ),
          ],
        ));
  }
}
