import "package:flutter/material.dart";
import "package:navigation_routing/screen2.dart";
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
              body: Center(
                child: TextButton(
                    child: Text("Screen 1"),
                     onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
                     }, 
                ),
              ),
            )
    );
  }
}