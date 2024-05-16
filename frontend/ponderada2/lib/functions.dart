import 'package:http/http.dart' as http;

Future<http.Response> createUser(user, password) {
  return http.post(Uri.http('0.0.0.0:5001', "/addUser"), body: {
    'username': user,
    'password': password,
  });
}

Future<http.Response> login(user, password) {
  return http.post(Uri.parse('http://0.0.0.0:5001/login'), body: {
    'username': user,
    'password': password,
  });
}

Future<http.Response> addTask(title, content, token) {
  return http.post(Uri.parse('http://localhost:8000/addTask'), body: {
    'title': title,
    'content': content,
  }, headers: {
    'Authorization': 'Bearer $token',
  });
}

Future<http.Response> updateTask(title, content, token) {
  return http.post(Uri.parse('http://localhost:8000/updateTask'), body: {
    'title': title,
    'content': content
  }, headers: {
    'Authorization': 'Bearer $token',
  });
}

Future<http.Response> deleteTask(title, token) {
  return http.post(Uri.parse('http://localhost:8000/deleteTask'), body: {
    'title': title
  }, headers: {
    'Authorization': 'Bearer $token',
  });
}

Future<http.Response> getTasks( token) {
  return http.get(Uri.parse('http://localhost:8000/deleteTask'), headers: {
    'Authorization': 'Bearer $token',
  });
}
