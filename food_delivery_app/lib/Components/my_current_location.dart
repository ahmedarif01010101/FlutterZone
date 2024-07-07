import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class MyCurrentLocation extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
             children: [
              //Address
              Text("Street 56 E-11, Islamabad", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
                  
              //Drop Down Menu
              Icon(Icons.arrow_drop_down_outlined)
                  
             ],
            ),
          )
         
        ],
      ),
    );
  }

  openLocationSearchBox(BuildContext context)
  {
    showDialog(
      context: context, 
    builder: (context) => AlertDialog(
      title: Text("Your Location"),
      content: TextField(
        decoration: InputDecoration(
          hintText: "Search address"
        ),
      ),
      actions: [
        //Cancel Button
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel")),
        
        //Save Button
        MaterialButton(
          onPressed: ()=> Navigator.pop(context),
          child: Text("Save"))
      ],
    ));
  }
}