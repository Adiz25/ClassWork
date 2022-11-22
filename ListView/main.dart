import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: MyScreen(),));
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  var myList = [
    Data("C","c.png"),
    Data("C++","cpp.png"),
    Data("JAVA","java.png"),
    Data("Python","python.png"),
    Data("JavaScript","js.png"),
    Data("HTML","html.png"),
    Data("CSS","css.png"),
    Data("PHP","php.png"),
    Data("Node Js","nodejs.png"),
    Data("Android","android.png"),
    Data("Flutter","flutter.png"),
    Data("iOS","ios.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView"),),
      body: ListView.builder(itemCount: myList.length,itemBuilder: (context,index){
        return Card(
          child: ListTile(
            onTap: (){
              print("Tapped On ${myList[index].getTitle}");
            },
            leading: CircleAvatar(backgroundImage: AssetImage("assets/images/${myList[index].getImage}"),),
            title: Text(myList[index].getTitle),
            subtitle: Text('$index'),
          ),
        );
      }),
    );
  }
}

class Data{
  String title,image;
  Data(this.title,this.image);

  String get getTitle => this.title;
  String get getImage => this.image;
}
