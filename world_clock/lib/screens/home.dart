import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:world_clock/model/world_clock_model.dart";
import 'package:world_clock/utils/spinner.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldClockModel world_clock = WorldClockModel(uri: "Europe/Berlin", flag: "germany.png", location: "Berlin");
  dynamic location_data;
  Timer? timer;
  @override
  void initState() 
  {
     super.initState();
     startTimer();
     getTime();
  }
   @override
   Widget build(BuildContext context)
   {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey
    ));
    Paint text_stroke = Paint();
    text_stroke.style = PaintingStyle.stroke;
    text_stroke.strokeWidth = 2.5;
    text_stroke.color = Colors.white;
     return Scaffold(
          body: SafeArea(
            child: world_clock.time == null? Spinner():Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
              image: DecorationImage(image: int.parse(location_data["hour"])>=5 && int.parse(location_data["hour"])<=17? AssetImage("images/morning.jpg"):AssetImage("images/night.jpg"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  TextButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, "/secondscreen").then((value) {
                        if(value!=null)
                      {
                        dynamic model_reciever = value;
                        world_clock = model_reciever["model"];
                        getTime();
                      }
                      });
                      
                    }, 
                    icon: Icon(Icons.map_outlined, color: Colors.white,size: 35, shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 30)
                    ],), 
                    label: Text("Change Location", style: TextStyle(color: Colors.red, fontSize: 30, shadows: [
                      Shadow(color: Colors.redAccent,
                      blurRadius: 15)
                    ]),)),
                  SizedBox(height: 40,),
                  Text(location_data["location"], style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, foreground: getKeyStroke(Colors.lightGreenAccent)),),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 2,
                        )
                      ]
                    ),
                    child: Divider(
                      color: Colors.red,
                      thickness: 5,
                      ),
                  ),
                  SizedBox(height: 5,),
                  Text("${location_data["hour"]}:${location_data["minutes"].toString().length == 1? "0${location_data["minutes"]}":"${location_data["minutes"]}"} ${int.parse(location_data["hour"])>=1 && int.parse(location_data["hour"])<=12? "AM":"PM"}",
                      style: TextStyle(fontSize: 75,fontWeight: FontWeight.bold,  foreground: getKeyStroke(Colors.white), shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                          blurRadius: 1,
                        )
                      ]),),
                    Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 2,
                        )
                      ]
                    ),
                    child: Divider(
                      color: Colors.red,
                      thickness: 5,
                      ),
                  ),
                  Text(location_data["seconds"], style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold, shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 30,)
                  ]),),
                ],
              ),
            ),
          ),
     );
   }

  void getTime() async
  {
      await world_clock.getTime();
      location_data = {
        "location": world_clock.location,
        "hour": world_clock.hour,
        "minutes": world_clock.minutes,
        "seconds": world_clock.seconds
      };
    setState(() {
      
    });
  }

   Paint getKeyStroke(Color color)
   {
      Paint text_stroke = Paint();
      text_stroke.style = PaintingStyle.stroke;
      text_stroke.strokeWidth = 2.5;
      text_stroke.color = color;
      return text_stroke;
   }

  void startTimer()
  {
    timer = Timer.periodic(Duration(seconds: 1), (timer) { 
    getTime();
    });
  }

  @override 
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    startTimer();
  }
}