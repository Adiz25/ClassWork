import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.purple))),
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Icon Button'),
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
  var sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),
              onPressed: () {
                print("Clicked elevated button");
              },
              child: Text("Click Me"),
              onLongPress: () {
                print("Long Clicked elevated button");
              },
            ),
            OutlinedButton(
                onPressed: () {
                  print("Clicked Outlined button button");
                },
                child: Text("Click Me")),
            TextButton(
                onPressed: () {
                  print("Clicked Text Button button");
                },
                child: Text("Click Me")),
            ElevatedButton.icon(
                onPressed: () {
                  print("Call Connected");
                },
                icon: Icon(Icons.call),
                label: Text("Call")),
            InkWell(
              child: Container(
                child: Text("Hello"),
              ),
              onTap: () {
                print("Ink Well Clicked");
              },
            )
          ]),
        ),
      ),
    );
  }
}
