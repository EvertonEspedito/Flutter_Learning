import 'package:flutter/material.dart';
import 'package:flutter_intro/helloword/hello_word_screen.dart';
import 'package:flutter_intro/scaffoldscreen/scaffold_screen.dart';

void main () {
  runApp(FlutterIntroApp());
}

class FlutterIntroApp extends StatelessWidget{
  const FlutterIntroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Flutter Introdução",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20, color: Colors.black54)
        )
      ),
      home: ScaffoldScreen(),
    );
  }
}