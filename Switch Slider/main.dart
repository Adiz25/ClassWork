import 'package:flutter/cupertino.dart';
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
  bool switchStatus = false;
  double sliderValue = 0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Switch"),),
      body: Column(
        children: [
          Switch(value: switchStatus, onChanged: (value){
            setState((){
              switchStatus = !switchStatus;
            });
          }),
          Visibility(
            visible: switchStatus,
            child: Row(
              children: [
                Slider(value: sliderValue, onChanged: (value){
                  setState((){
                    sliderValue = value;
                  });
                }),
                Text('$sliderValue'),
              ],
            ),
          ),
          Visibility(visible: !switchStatus,child: CupertinoActivityIndicator(animating: true,radius: 10.0,)),
        ],
      ),
    );
  }

}
