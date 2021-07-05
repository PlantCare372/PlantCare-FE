import 'dart:convert';
import 'package:http/http.dart';

Future signup(String email, String pass, String fullname) async {
  Response res = await post(
    Uri.parse('http://178.128.127.43/api/v1/users/open'),
    headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        jsonEncode({'email': email, 'password': pass, 'full_name': fullname, 'is_active': true, 'is_superuser': false}),
  );
  return res.statusCode;
}
