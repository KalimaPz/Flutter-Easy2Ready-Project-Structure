import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apicall/config/config.dart';
import 'package:apicall/models/user.dart';

class ActionSecondPage {
  static getOrder() {
    return print("Get ORder");
  }

  static getUser() {
    return print("Get User");
  }

  static fetchUser() async {
    final List<User> list = [];
    try {
      final response = await http.get(Uri.parse(Config.baseUrl));

      final body = json.decode(response.body) as List;
      body.forEach((element) {
        list.add(User.fromJson(element));
      });
      return list;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
