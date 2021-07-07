import 'dart:convert';
import 'package:http/http.dart';
import 'package:plant_app/utils/loginCredentials.dart';

Future addtofav(int id) async {
  Response res = await get(
    Uri.parse('http://178.128.127.43/api/v1/users/add-to-favorites/' + id.toString()),
    headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${LoginCredentials.getToken()}'
    },
  );
  return res.statusCode;
}

/*Future addtomyplant(int id) async {
  Response res = await get(
    Uri.parse('http://178.128.127.43/api/v1/users/add-to-myplant/' + id.toString()),
    headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${LoginCredentials.getToken()}'
    },
  );
  return res.statusCode;
}*/