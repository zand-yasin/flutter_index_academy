import 'package:dartlearning/api/album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    // futureAlbum = ;
  }

  Future<List<Album>> fetchAlbum() async {
    // http://data.fixer.io/api/latest?access_key=575ea0af0cc9d30c1e3ec88623df6a86&symbols=iqd,usd
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Album> albumData = <Album>[];

      final json = jsonDecode(response.body);
      json.forEach((element) {
        {
          Album data = Album.fromMap(element);
          albumData.add(data);
        }
      });

      return albumData;
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
        child: FutureBuilder<List<Album>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                          leading: Text(snapshot.data![index].id.toString()),
                          trailing: Icon(Icons.insert_emoticon),
                          title: Text(snapshot.data![index].title)),
                    );
                  });
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
