import 'package:flutter/material.dart';

class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold Screen"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text(
          "This is a Scaffold Screen",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(onPressed: () {}, 
      child: const Icon(Icons.add))
    );
  }
}