import 'dart:convert';

import 'package:http/http.dart';

Future<Map<String, dynamic>> jsonParse(StreamedResponse response) async {
  String res = await response.stream.bytesToString();
  return jsonDecode(res);
}
