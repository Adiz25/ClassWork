import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Leap Year'),
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
  String ans = "";
  int n1 = 0;
  int n2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (String text) {
                n1 = int.parse(text);
              },
              decoration: InputDecoration(hintText: "Number 1"),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showAns();
                    },
                    child: Text("Check")),
              ],
            ),
            Text(ans)
          ],
        ),
      ),
    );
  }

  showAns() {
    if (n1 % 4 == 0) {
      if (n1 % 100 != 0) {
        setState(() {
          ans = "Leap Year";
        });
      } else {
        if (n1 % 400 == 0) {
          setState(() {
            ans = "Leap Year";
          });
        } else {
          setState(() {
            ans = "Not Leap Year";
          });
        }
      }
    } else {
      setState(() {
        ans = "Not Leap Year";
      });
    }
  }
}
