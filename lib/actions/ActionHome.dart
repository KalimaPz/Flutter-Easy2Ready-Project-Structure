import 'dart:convert';

import 'package:apicall/config/config.dart';
import 'package:apicall/models/user.dart';
import 'package:http/http.dart' as http;

class ActionHome {
  static getUser() {
    return print("GET USER");
  }

  static getOrder() {
    return print("GET ORDER");
  }

  static fetchUser() async {
   final response = await http.get(Uri.parse(Config.baseUrl));
      print(response.statusCode);
  }
}
