import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
        ),
        body: Column(children: [movieCard()]));
  }

  Widget movieCard() {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          Text(
            'Avengers EndGame',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 10,),
          Image.asset('images/avengers.jpg'),
        ],
      ),
    );
  }
}
