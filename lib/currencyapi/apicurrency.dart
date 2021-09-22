import 'package:dartlearning/currencyapi/currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyApi extends StatefulWidget {
  @override
  _CurrencyApiState createState() => _CurrencyApiState();
}

class _CurrencyApiState extends State<CurrencyApi> {
  late Future<Currency> futureCurrency;

  @override
  void initState() {
    super.initState();
    // futureAlbum = ;
  }

  Future<Currency> fetchCurrency() async {
    final response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=575ea0af0cc9d30c1e3ec88623df6a86&symbols=iqd,usd'));

    if (response.statusCode == 200) {
      print(response.body);
      print(jsonDecode(response.body)['rates']);
      final json = jsonDecode(response.body);
      return Currency.fromMap(json);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Currency>(
          future: fetchCurrency(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Card(
                    child: ListTile(
                        trailing: Icon(Icons.insert_emoticon),
                        title: Text((snapshot.data!.usd! * 100).toString())),
                  ),
                  Card(
                    child: ListTile(
                        trailing: Icon(Icons.insert_emoticon),
                        title: Text((snapshot.data!.iqd! * 100).toString())),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
