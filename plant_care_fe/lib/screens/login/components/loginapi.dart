import 'dart:convert';
import 'package:plant_app/utils/loginCredentials.dart';
import 'package:http/http.dart' as http;

Future login(String email, String pass) async {
  var headers = {'Content-Type': 'application/x-www-form-urlencoded', 'accept': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://178.128.127.43/api/v1/login/access-token'));
  request.bodyFields = {
    'username': email,
    'password': pass,
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  String res = await response.stream.bytesToString();
  Map<String, dynamic> body = jsonDecode(res);
  LoginCredentials.setToken(body["access_token"]);
  return response.statusCode;
}
