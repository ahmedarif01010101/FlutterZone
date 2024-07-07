import "package:flutter/material.dart";
import "package:world_clock/model/world_clock_model.dart";
class Locations extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    List <WorldClockModel> locations = [
      WorldClockModel(uri: "Europe/Berlin", flag: "germany.png", location: "Germany"),
      WorldClockModel(uri: "Europe/Lisbon", flag: "portugal.png", location: "Portugal"),
      WorldClockModel(uri: "Europe/Madrid", flag: "spain.png", location: "Spain"),
      WorldClockModel(uri: "Europe/Warsaw", flag: "poland.png", location: "Poland"),
      WorldClockModel(uri: "Asia/Gaza", flag: "palestine.jpg", location: "Palestine"),
      WorldClockModel(uri: "Australia/Perth", flag: "austrailia.png", location: "Austrailia/Perth"),
      WorldClockModel(uri: "Africa/Cairo", flag: "egypt.png", location: "Egypt"),
      WorldClockModel(uri: "Asia/Dubai", flag: "dubai.jpg", location: "Dubai"),
      WorldClockModel(uri: "Asia/Kabul", flag: "afghanistan.jpg", location: "Afghanistan"),
      WorldClockModel(uri: "Asia/Jakarta", flag: "indonesia.png", location: "Indonesia"),
      WorldClockModel(uri: "Asia/Karachi", flag: "pakistan.jpg", location: "Pakistan"),
      WorldClockModel(uri: "Asia/Kolkata", flag: "india.jpg", location: "India"),
      WorldClockModel(uri: "Asia/Tehran", flag: "iran.jpg", location: "Iran"),
      WorldClockModel(uri: "Asia/Singapore", flag: "singapore.png", location: "Singapore"),
      ];
    return Scaffold(
      appBar: AppBar(title: Text("locations"),),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: CircleAvatar(
              maxRadius: 17,
              backgroundImage: AssetImage("images/${locations[index].flag}"),
            ),
            title: Text(locations[index].location),
            onTap: (){
              Navigator.pop(context, {
                "model": locations[index]
              });
            },
          );
        }),
      )
    );
  }
}