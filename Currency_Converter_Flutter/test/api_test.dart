import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("APi testing the api used ", () { 

  test('Positive API test: Successful conversion', () async {
    final response = await http.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));

    // Verify response status code
    expect(response.statusCode, 200);
    
    // Verify response body
    final responseBody = json.decode(response.body);
    expect(responseBody.containsKey('rates'), true);
  });

  test('Negative API test: Error fetching data', () async {
    final response = await http.get(Uri.parse('https://open.er-api.com/v6/kaesdfw/efd'));

    // Verify response status code for error
    expect(response.statusCode, isNot(200));
    
    // Verify response body for error message
    // expect(response.body, 'Error fetching data');
  });
  });
}


