import 'dart:ui';
import 'routes.dart';
import 'package:flutter/material.dart';
class GetStarted extends StatefulWidget {
  const GetStarted({super.key});
  @override
  State<GetStarted> createState() => _getstartedState();
}

class _getstartedState extends State<GetStarted> {
  bool changebutton=false;
  @override
  Widget build(BuildContext context) {
    return Material(
       color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Image.asset("images/logo.png",
            fit: BoxFit.cover,
            width: 350,
            height: 350,),
          SizedBox(height: 20,),
            Text("Chatting made fun with Chatzy",style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 50,),
            InkWell(//its for push button of container
              onTap: () async {
                setState((){
                  changebutton=true;
                },);
                await Navigator.pushNamed(context, Myroute.wrapper);
                setState((){
                  changebutton=false;
                },);
              },
              child:  AnimatedContainer(
                duration: Duration(seconds: 1),
                width:changebutton?50: 140,
                height: 50,
                alignment: Alignment.center,//its for font in center
                child:  changebutton?Icon(Icons.verified,color: Colors.black,size: 50,)://for icon in button
                Text("Let's Start",style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 25),
                ),
                decoration: BoxDecoration(//to circle & curve
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(changebutton?50: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



