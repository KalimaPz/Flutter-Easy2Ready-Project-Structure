import 'package:flutter_project_boiler_plate/pages/Home.dart';
import 'package:flutter_project_boiler_plate/pages/SecondPage.dart';

class Routes {
  static final pages = {
    Home.routeName: (context) => Home(),
    SecondPage.routeName: (context) => SecondPage(),
  };
}
