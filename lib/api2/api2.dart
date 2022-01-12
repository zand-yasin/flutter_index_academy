import 'package:dartlearning/api2/Album2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api2 extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api2> {
  TextEditingController number = TextEditingController();
  String Textholder = ' ';

  //@override

  Future<Album2> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=6093b5429833c2585bf64af8b26b477f&symbols=USD,AUD,CAD,PLN,MXN&format=1'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Album2 data = Album2.fromJson(json);

      return data;
      //  return albumData;
    } else {
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
        child: FutureBuilder<Album2>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        TextField(
                          controller: number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter EUR value'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              final eur = (number.text == "")
                                  ? 0
                                  : int.parse(number.text);
                              // print(eur);

                              final USD =
                                  snapshot.data!.rates['USD']?.toDouble();
                              //snapshot.data!.rates['USD'];
                              print(USD);

                              final change = eur * USD!.toDouble();
                              print(change);
                              setState(() {
                                Textholder = "$change USD ";
                              });
                            },
                            child: Text("Convert")),
                        /*  Card(
                          child: ListTile(
                              // leading: Text(snapshot.data!.toString()),
                              trailing: Icon(Icons.insert_emoticon),
                              // title: Text(snapshot.data![index].rates)),
                              title:
                                  Text(snapshot.data!.rates['USD'].toString())),
                        ),*/
                        Container(
                          alignment: Alignment.center,
                          width: 500,
                          height: 100,
                          // color: Colors.white70,
                          child: Text(
                            Textholder,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
