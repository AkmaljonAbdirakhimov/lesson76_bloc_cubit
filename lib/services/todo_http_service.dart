import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoHttpService {
  Future<void> addTodo(String title, bool isDone) async {
    Uri url = Uri.parse(
        "https://dars66-ae91b-default-rtdb.firebaseio.com/todos.json");

    final response = await http.post(
      url,
      body: jsonEncode(
        {
          "title": title,
          "isDone": isDone,
        },
      ),
    );
  }
}
