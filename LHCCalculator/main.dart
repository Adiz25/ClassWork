import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: MyScreen()));
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  var con1 = TextEditingController();
  var con2 = TextEditingController();
  var ans = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            "App",
            style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
          )),
          TextField(
            controller: con1,
            keyboardType: TextInputType.numberWithOptions(),
          ),
          TextField(
              controller: con2,
              keyboardType: TextInputType.numberWithOptions()),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    operation(con1.text, con2.text, 1);
                  },
                  child: Text("Add")),
              ElevatedButton(
                  onPressed: () {
                    operation(con1.text, con2.text, 2);
                  },
                  child: Text("Sub")),
              ElevatedButton(
                  onPressed: () {
                    operation(con1.text, con2.text, 3);
                  },
                  child: Text("Mul")),
              ElevatedButton(
                  onPressed: () {
                    operation(con1.text, con2.text, 4);
                  },
                  child: Text("Div")),
              ElevatedButton(
                  onPressed: () {
                    operation(con1.text, con2.text, 5);
                  },
                  child: Text("Mod")),
            ],
          ),
          Text(ans),
          Image.asset("assets/images/image.jpg")
        ],
      ),
    );
  }

  void operation(var n1, var n2, var op) {
    Fluttertoast.showToast(
        msg: "Answer is ready...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    if (op == 1) {
      setState(() {
        ans = (int.parse(n1) + int.parse(n2)).toString();
      });
    } else if (op == 2) {
      setState(() {
        ans = (int.parse(n1) - int.parse(n2)).toString();
      });
    } else if (op == 3) {
      setState(() {
        ans = (int.parse(n1) * int.parse(n2)).toString();
      });
    } else if (op == 4) {
      setState(() {
        ans = (int.parse(n1) / int.parse(n2)).toString();
      });
    } else if (op == 5) {
      setState(() {
        ans = (int.parse(n1) % int.parse(n2)).toString();
      });
    }
  }
}
