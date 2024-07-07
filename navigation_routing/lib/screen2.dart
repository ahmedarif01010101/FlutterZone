import "package:flutter/material.dart";


class Screen2 extends StatefulWidget
{
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
            home: Scaffold(
              body: Center(
                child: TextButton(
                  child: Text("Screen 2"),
                  onPressed: (){
                    
                  },
                ),
              ),
            ),
    );
  }
}