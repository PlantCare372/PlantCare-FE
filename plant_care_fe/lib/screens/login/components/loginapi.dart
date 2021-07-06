import 'dart:convert';
import 'package:http/http.dart';
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
  final Response userReq = await get(
    Uri.parse('http://178.128.127.43/api/v1/users/me'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${LoginCredentials.getToken()}'
    },
  );
  if (userReq.statusCode == 200) {
    body = jsonDecode(userReq.body);
    print(body);
    LoginCredentials.setEmail(body["email"]);
    LoginCredentials.setUserName(body["full_name"]);
    LoginCredentials.setUserId(body["id"].toString());
    jsonDecode(userReq.body);
  } else {
    throw Exception('Failed to get data.');
  }

  return response.statusCode;
}
