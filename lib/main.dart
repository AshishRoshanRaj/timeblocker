import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time blocker',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Homescreen(),
    );
  }
}
class Homescreen extends StatefulWidget {
   Homescreen({ Key? key }) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  bool _pressed = false;
  AudioPlayer player = AudioPlayer();

  Timer? _timer;


  void startTimer(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_pressed==true ? 'Every Minute it will beep' : 'Click to beep'}'),
            ElevatedButton(child:_pressed ? Text('On',style: TextStyle(fontSize: 30),) : Text('Off'),onPressed: (){
              setState(() {
              _pressed = !_pressed;
              });
              if(_pressed==true){
                _timer = Timer.periodic(Duration(seconds: 60), (timer) {
                  player.setAsset('assets/song.wav');
                  player.play();
                });
              }else{
                _timer?.cancel();
              }
            },
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(50),primary:_pressed ?Color(0xff35E031) : Color(0xffB8B5B4)),),
          ],
        )
      ),
    );
  }
}