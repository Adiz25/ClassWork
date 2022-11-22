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
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Buttons Experiment'),
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
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Click Me")),
            OutlinedButton(onPressed: () {}, child: Text("Click Me")),
            TextButton(onPressed: () {}, child: Text("Click Me")),
            ElevatedButton(
              onPressed: () {},
              child: Text("Click me"),
              onLongPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
