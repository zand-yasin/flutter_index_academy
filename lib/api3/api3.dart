import 'package:dartlearning/api3/Album3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api3 extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api3> {
  TextEditingController number = TextEditingController();
  String Textholder = ' ';
  //@override

  Future<Album3> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'http://data.fixer.io/api/latest?access_key=6093b5429833c2585bf64af8b26b477f&symbols=USD,AUD,CAD,PLN,MXN,CAD,IQD,AED,BBD&format=1'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Album3 data = Album3.fromJson(json);

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
        child: FutureBuilder<Album3>(
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
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter EUR value'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                  child: Text("USD")),
                              ElevatedButton(
                                  onPressed: () {
                                    final eur = (number.text == "")
                                        ? 0
                                        : int.parse(number.text);
                                    // print(eur);

                                    final USD =
                                        snapshot.data!.rates['AED']?.toDouble();
                                    //snapshot.data!.rates['USD'];
                                    print(USD);

                                    final change = eur * USD!.toDouble();
                                    print(change);
                                    setState(() {
                                      Textholder = "$change AED ";
                                    });
                                  },
                                  child: Text("AED")),
                              ElevatedButton(
                                  onPressed: () {
                                    final eur = (number.text == "")
                                        ? 0
                                        : int.parse(number.text);
                                    // print(eur);

                                    final USD =
                                        snapshot.data!.rates['BBD']?.toDouble();
                                    //snapshot.data!.rates['USD'];
                                    print(USD);

                                    final change = eur * USD!.toDouble();
                                    print(change);
                                    setState(() {
                                      Textholder = "$change BBD ";
                                    });
                                  },
                                  child: Text("BBD")),
                              ElevatedButton(
                                  onPressed: () {
                                    final eur = (number.text == "")
                                        ? 0
                                        : int.parse(number.text);
                                    // print(eur);

                                    final USD =
                                        snapshot.data!.rates['IQD']?.toDouble();
                                    //snapshot.data!.rates['USD'];
                                    print(USD);

                                    final change = eur * USD!.toDouble();
                                    print(change);
                                    setState(() {
                                      Textholder = "$change IQD ";
                                    });
                                  },
                                  child: Text("IQD")),
                            ],
                          ),
                        ),
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
                        ),
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
