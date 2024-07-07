import "package:flutter/material.dart";
import "package:world_clock/screens/home.dart";
import "package:world_clock/screens/locations.dart";

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
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes: {
            "/home": (context) => Home(),
            "/secondscreen": (context) => Locations()
          },
    );
     
  }
}