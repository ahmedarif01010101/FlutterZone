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
              body: const Center(
                child: CircleAvatar(
                  maxRadius: 77,
                  minRadius: 20,
                  backgroundImage: NetworkImage("https://www.techgrama.in/wp-content/uploads/2021/06/dp-for-instagram-for-boy-23.jpg"),
                )
              )
            ),
    );
  }
}