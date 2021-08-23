import 'package:apicall/config/config.dart';
import 'package:http/http.dart' as http;

class ActionPostUser {
  static postUserData({Map payload}) async {
    try {
      final res = await http.post(
        Uri.parse("${Config.backEnd}/users/post"),
        body: payload,
        // headers: {
        //   "Authorization": "accessTOken",
        // },
      );
      print(res.body);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
