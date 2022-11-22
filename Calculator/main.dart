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
      title: 'Basic Calculator',
      home: MyHomePage(title: 'Basic Calculator'),
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
            TextField(
              onChanged: (String text) {
                n2 = int.parse(text);
              },
              decoration: InputDecoration(hintText: "Number 2"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showAns("1");
                    },
                    child: Text("Add")),
                ElevatedButton(
                    onPressed: () {
                      showAns("2");
                    },
                    child: Text("Sub")),
                ElevatedButton(
                    onPressed: () {
                      showAns("3");
                    },
                    child: Text("Mul")),
                ElevatedButton(
                    onPressed: () {
                      showAns("4");
                    },
                    child: Text("Div")),
                ElevatedButton(
                    onPressed: () {
                      showAns("5");
                    },
                    child: Text("Mod")),
              ],
            ),
            Text(ans)
          ],
        ),
      ),
    );
  }

  showAns(String op) {
    if (op == "1") {
      setState(() {
        ans = (n1 + n2).toString();
      });
    } else if (op == "2") {
      setState(() {
        ans = (n1 - n2).toString();
      });
    } else if (op == "3") {
      setState(() {
        ans = (n1 * n2).toString();
      });
    } else if (op == "4") {
      setState(() {
        ans = (n1 / n2).toString();
      });
    } else if (op == "5") {
      setState(() {
        ans = (n1 % n2).toString();
      });
    }
  }
}
