
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {

    _CurrencyConverterState();
      
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  String result = '';
  List<String> currencies = ['USD', 'EUR', 'GBP', 'JPY', 'INR']; // Add more as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Currency Converter '),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: fromCurrency,
              onChanged: (value) {
                setState(() {
                  fromCurrency = value!;
                });
              },
              items: currencies.map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
               decoration:  const InputDecoration(
                labelText: 'Enter Amount',
              ),
            ),
             const SizedBox(height: 20),
            DropdownButton<String>(
              value: toCurrency,
              onChanged: (value) {
                setState(() {
                  toCurrency = value!;
                });
              },
              items: currencies.map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convertCurrency();
              },
              child: Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(result),
          ],
        ),
      ),
    );
  }

 Future<void> convertCurrency() async {
  const  apiKey = 'c5d1b98b71e9ffac13de6aad';
  final url = 'https://open.er-api.com/v6/latest/$fromCurrency';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    double rate = data['rates'][toCurrency];
    double amount = double.parse(amountController.text);

    setState(() {
      result = 'Converted: ${(amount * rate).toStringAsFixed(2)} $toCurrency';
    });
  } else {
    setState(() {
      result = 'Error fetching data';
    });
  }
}

}
