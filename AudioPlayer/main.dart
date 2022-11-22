import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main(){
  runApp(MaterialApp(home: MyScreen(),));
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  var audioPlayer = AudioPlayer();
  var audioPath = "audio/audioFile.mp3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView"),),
      body: Column(children: [
        ElevatedButton(onPressed: () async {
          await audioPlayer.play(AssetSource(audioPath));
        }, child: Text("Play")),
        ElevatedButton(onPressed: () async{
          await audioPlayer.pause();
        }, child: Text("Pause")),
        ElevatedButton(onPressed: () async{
          await audioPlayer.resume();
        }, child: Text("Resume")),
        ElevatedButton(onPressed: () async{
          await audioPlayer.stop();
        }, child: Text("Stop"))
      ],)
    );
  }
}
