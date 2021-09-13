import 'dart:convert';

import 'package:flutter_project_boiler_plate/config/config.dart';
import 'package:http/http.dart' as http;

class ActionHome {
  static getTodayCases() async {
    try {
      final res =
          await http.get(Uri.parse("${Config.baseUrl}/today-cases-all"));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        print("Error! Status Code : ${res.statusCode}");
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
