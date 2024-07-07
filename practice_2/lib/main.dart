import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 100,
              top: 100,
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.green,
                child: const Text("Container 1"),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text("Container 2"),
              ),
            ),
            Positioned(
              left:100,
              top: 100,
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                color: Colors.orange,
                child: const Text("Container 3"),
              ),
            ),
              Text("Hello")
          ],
        ),
      ),
    );
  }
}
