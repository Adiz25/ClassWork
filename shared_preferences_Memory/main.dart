import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyScreen()));
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  var nameController = TextEditingController();
  var mytxt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    saveData();
                    print("Save Clicked");
                  },
                  child: Text("Save")),
              ElevatedButton(
                  onPressed: () {
                    getData();
                    print("Get Clicked");
                  },
                  child: Text("Get")),
              ElevatedButton(
                  onPressed: () {
                    removeData();
                    print("Remove Clicked");
                  },
                  child: Text("Remove")),
              Text(mytxt),
            ],
          ),
        ],
      ),
    );
  }

  void saveData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("counter", nameController.text);
    setState(() {
      mytxt = "Saved";
    });
    showSnackBar("Saved");
  }

  void getData() async {
    var prefs = await SharedPreferences.getInstance();
    var n = prefs.getString("counter");
    setState(() {
      mytxt = n.toString();
    });
    showSnackBar(n);
  }

  void removeData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("counter");
    setState(() {
      mytxt = "Removed";
    });
    showSnackBar("Removed");
  }

  showSnackBar(var msg) {
    var s = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(s);
  }
}
