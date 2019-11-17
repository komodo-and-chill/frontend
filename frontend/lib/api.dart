import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<int> getPoints() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse('http://192.168.137.1:8081/api/users/'+prefs.getInt('user_id').toString()+'/activities');
  var body = json.decode((await http.get(uri)).body);
  prefs.setInt('points', body['points']);
  return body['points'];
}

Future<void> putPoints(String description, int points) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  Uri uri = Uri.parse('http://192.168.137.1:8081/api/users/'+prefs.getInt('user_id').toString()+'/activities');
  http.MultipartRequest request = http.MultipartRequest('POST', uri);
  request.fields['description'] = description;
  request.fields['points'] = points.toString();

  var response = await http.Response.fromStream(await request.send());
  var body = json.decode(response.body);
  prefs.setInt('points', prefs.getInt('points') + points);
  return;
}