import 'dart:convert';

import 'package:bloc_class01/models/login_req_model.dart';
import 'package:bloc_class01/models/login_res_model.dart';
import 'package:http/http.dart' as htttp;

class LoginRepo {
  Future<LoginResModel> login(String userName, String password) async {
    var data = LoginReqModel(username: userName, password: password);

    htttp.Response response = await htttp.post(
        Uri.parse("https://dummyjson.com/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data.toJson()));

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body.toString());

      return LoginResModel.fromJson(decode);
    } else {
      throw Exception("Invalid Data");
    }
  }
}
