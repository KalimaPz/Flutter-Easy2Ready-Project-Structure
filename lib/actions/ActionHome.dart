import 'dart:convert';

import 'package:apicall/config/config.dart';
import 'package:apicall/models/user.dart';
import 'package:http/http.dart' as http;

class ActionHome {
  static getUser() async  {
  try {
      final res = await http.get(Uri.parse("${Config.backEnd}/users/getUsers"));
      print(res.body);
      return res.body;
  }
   catch(e) {
     return false;
   }
  
  }

  static getOrder() {
    return print("GET ORDER");
  }

  static fetchUser() async {
   final response = await http.get(Uri.parse(Config.baseUrl));
      print(response.statusCode);
  }

  
}
