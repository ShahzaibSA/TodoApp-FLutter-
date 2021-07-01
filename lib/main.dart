import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/TodoApp.dart';


void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen.withScreenFunction(
        splash: Image.asset('assets/launch_image.gif'), 
        screenFunction: () async{
          return TodoApp();
        },
        // splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.black,
        )
    );
  }
}