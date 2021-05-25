import 'dart:convert';
import 'package:http/http.dart';

Future signup (String email, String pass, String fullname) async {
    Response res = await post(
      Uri.parse('http://178.128.127.43/api/v1/users/'),
      headers: <String, String>{
        'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjIwOTg0MzQsInN1YiI6IjEifQ.DePTdoDHEGvlmMM8GjoAxZIDNunaQm3z1cs8uFUy9uE'
    },
      body: jsonEncode({'email': email, 'password': pass, 'full_name': fullname, 'is_active': true, 'is_superuser': false}),
    );
    return res.statusCode;
  }