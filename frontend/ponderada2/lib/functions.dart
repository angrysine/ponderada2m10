import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "dart:convert";

import 'package:http/http.dart' as http;

var urlBase = "54.156.146.79";
const storage = FlutterSecureStorage();
Future<http.Response> createUser(user, password) {
  return http.post(Uri.parse("http://$urlBase:5001/addUser"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'username': user,
        'password': password,
      }));
}

Future<http.Response> login(user, password) {
  return http.post(Uri.parse('http://$urlBase:5001/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'username': user,
        'password': password,
      }));
}

Future<http.Response> addTask(title, content, token) {
  return http.post(Uri.parse('http://$urlBase:5001/addTask'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(
        {
          'title': title,
          'content': content,
        },
      ));
}

Future<http.Response> updateTask(title, content, token) {
  return http.put(
    Uri.parse('http://$urlBase:5001/updateTask'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: json.encode({'title': title, 'content': content}),
  );
}

Future<http.Response> deleteTask(title, token) {
  return http.delete(
    Uri.parse('http://$urlBase:5001/deleteTask'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: json.encode({'title': title}),
  );
}

Future<http.Response> getTasks(token) {
  print(token);
  return http.get(Uri.parse('http://$urlBase:5001/getTasks'), headers: {
    'Authorization': 'Bearer $token',
  });
}

void saveToken(token) async {
  await storage.write(key: 'token', value: token);
}

String getToken(response) {
  var token = json.decode(response.body);
  print(token);
  return token['token'];
}

Future<String?> getTokenFromStorage() async {
  return await storage.read(key: 'token');
}
