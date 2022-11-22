import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Options { SimpleText, AlertDialog, SnackBar }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Calculator with Answer'),
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
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  Options? _options = Options.SimpleText;

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
              keyboardType: TextInputType.numberWithOptions(),
              controller: n1,
              decoration: const InputDecoration(hintText: "Number 1"),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: n2,
              decoration: const InputDecoration(hintText: "Number 2"),
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
            Row(
              children: [
                Radio(
                    value: Options.SimpleText,
                    groupValue: _options,
                    onChanged: (Options? value) {
                      setState(() {
                        _options = value;
                      });
                    }),
                Text("Simple Text"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: Options.AlertDialog,
                    groupValue: _options,
                    onChanged: (Options? value) {
                      setState(() {
                        _options = value;
                      });
                    }),
                Text("Alert Dialog"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: Options.SnackBar,
                    groupValue: _options,
                    onChanged: (Options? value) {
                      setState(() {
                        _options = value;
                      });
                    }),
                Text("Snackbar"),
              ],
            ),
            Text(ans)
          ],
        ),
      ),
    );
  }

  showAns(String op) {
    int n1 = int.parse(this.n1.text);
    int n2 = int.parse(this.n2.text);
    if (op == "1") {
      ans = (n1 + n2).toString();
    } else if (op == "2") {
      ans = (n1 - n2).toString();
    } else if (op == "3") {
      ans = (n1 * n2).toString();
    } else if (op == "4") {
      ans = (n1 / n2).toString();
    } else if (op == "5") {
      ans = (n1 % n2).toString();
    }
    if (_options == Options.SimpleText) {
      setState(() {});
    } else if (_options == Options.AlertDialog) {
      showAnsDialog(ans);
    } else {
      showAnsSnackBar(ans);
    }
  }

  showAnsDialog(String ans) {
    showDialog(
        context: context,
        builder: (BuildContext) => AlertDialog(
              title: Text("Answer Dialog"),
              content: Text("Answer is $ans"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  showAnsSnackBar(String ans) {
    final snackBar = SnackBar(content: Text("Answer is $ans"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
