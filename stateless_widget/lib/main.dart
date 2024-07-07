import "package:flutter/material.dart";

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text("Stateless Widget"),
                  backgroundColor: Colors.blue.shade700,
                ),
                backgroundColor: Colors.grey,
                body: Center(
                        child: Text("Stateless Widget")
                ),
              )
    );
  }
}
