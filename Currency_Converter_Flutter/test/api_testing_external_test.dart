import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  group('CRUD Operations ', () {
    test('Creating a new user', () async {
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

    test('getting  user information', () async {
      const userId = 2; 
      final response = await http.get(Uri.parse('https://reqres.in/api/users/$userId'));
     
      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });

    test('Updating  user information', () async {
      const  userId = 2; 
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

    test('Deleting  a user', () async {
      const  userId = 2; 
      final response = await http.delete(Uri.parse('https://reqres.in/api/users/$userId'));

      expect(response.statusCode, greaterThanOrEqualTo(200));
      expect(response.statusCode, lessThan(300));
    });
  });
}
