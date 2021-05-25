import 'package:http/http.dart' as http;

Future login (String email, String pass) async {
  var headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjIzNDg1NDIsInN1YiI6IjEifQ.GttJZzL-EOO3g_dvXhcMUaQ5B7XFggn3h8bwnbF8GaY',
  'accept': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://178.128.127.43/api/v1/login/access-token'));
request.bodyFields = {
  'username': email,
  'password': pass,
};
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
    return response.statusCode;
}