import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Movie Cards',
      home: MovieCards(),
    );
  }
}

class MovieCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieCardsState();
  }
}

class _MovieCardsState extends State<MovieCards> {
  List<Map> movies = [];

  getData() {
    http
        .get('https://flutter-workshop-april.firebaseio.com/movies.json')
        .then((response) {
      json.decode(response.body).forEach((dynamic movieId, dynamic movieData) {
        setState(() {
          movies.add(movieData);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return movieCard(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        mini: true,
        child: Icon(Icons.movie),
        onPressed: () {
          getData();
        },
      ),
    );
  }

  Widget movieCard(int index) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: <Widget>[
          Image.network(movies[index]['image']),
          Positioned(
            bottom: 0.0,
            width: double.maxFinite,
            child: Container(
              color: Colors.black45,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                movies[index]['title'].toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
