import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  group('CRUD Operations on the reqres.in API', () {
    test('Create a new user (POST)', () async {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'Test User',
          'job': 'Tester',
        }),
      );

      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });

    test('Retrieve user information (GET)', () async {
      const userId = 2; // Replace with a valid user ID
      final response = await http.get(Uri.parse('https://reqres.in/api/users/$userId'));
      final responseBody = json.decode(response.body);

      print(responseBody);

      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });

    test('Update user information', () async {
      final userId = 2; // Replace with a valid user ID
      final response = await http.put(
        Uri.parse('https://reqres.in/api/users/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'Updated Name',
          'job': 'Updated Job',
        }),
      );

      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });

    test('Delete a user', () async {
      final userId = 2; // Replace with a valid user ID
      final response = await http.delete(Uri.parse('https://reqres.in/api/users/$userId'));

      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });
  });
}
