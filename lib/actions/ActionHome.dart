import 'package:flutter_project_boiler_plate/config/config.dart';

class ActionHome {
  static action1() {
    return print("home action 1");
  }
  static action2() {
    return print("${Config.baseUrl}");
  }
}