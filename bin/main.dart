import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  try {
    final response = await http.get(Uri.parse('https://random-data-api.com/api/v2/users?size=12')); 

       if (response.statusCode == 200) {

      final List<dynamic> jsonData = jsonDecode(response.body);

      for (var user in jsonData) {

        print('UID: ${user['uid']}, Name: ${user['first_name']} ${user['last_name']}');
      }
    } else {

      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}