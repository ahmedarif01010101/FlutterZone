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
                title: Text("Columns and Rows"),
                backgroundColor: Colors.blue,
              ),
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text("Hello"),

                    Container(
                      color: Colors.red,
                      child: Text("Container 1"),
                    ),
                     Container(
                      color: Colors.green,
                      child: Text("Container 2"),
                    ),
                     Container(
                      color: Colors.cyan,
                      child: Text("Container 3"),
                    )
                  ]),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text("Hello"),

                //     Container(
                //       color: Colors.red,
                //       child: Text("Container 1"),),
                //     Container(
                //       color: Colors.yellow,
                //       child: Text("Container 2"),),
                //     Container(
                //       color: Colors.green,
                //       child: Text("Container 3"),)
                // ]),
              ),
            ),
    );
  }
}