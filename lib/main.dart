import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '初めての Flutter '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<List<Color>> _colors = const [
    [Color(0xffe4a972), Color(0xff9941d8)],
    [Color(0xff49d3ff), Color(0xffff49b6)],
    [Color(0xffff8a65), Color(0xff9fa8da)],
    [Color(0xfffff176), Color(0xff1976d2)],
    [Color(0xfff06292), Color(0xffb39ddb)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.lightbulb_outline), Text("初めての Flutter")],
        ),
      ),
      body: Center(
          child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: _colors.map((_c) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: _c,
                    ),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.emoji_people,
                    color: Colors.white,
                    size: 64.0,
                  )));
            },
          );
        }).toList(),
      )),
    );
  }
}
