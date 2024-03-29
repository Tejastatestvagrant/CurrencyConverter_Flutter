import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group("APi testing the api used ", () { 

  test('positive test: Successful ', () async {
    final response = await http.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));
  
    expect(response.statusCode, 200);
    
    final responseBody = json.decode(response.body);
    expect(responseBody.containsKey('rates'), true);
  });

  test('negative test: Error fetching data', () async {
    final response = await http.get(Uri.parse('https://open.er-api.com/v6/kaesdfw/efd'));
    expect(response.statusCode, isNot(200));
    
    
  });
  });
}


