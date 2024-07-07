import "package:flutter/material.dart";

class MyDescription extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    TextStyle primary_color = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    TextStyle secondary_color = TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(7)
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Delivery Fee
          Column(
            children: [
              Text("\$0.99", style: primary_color),
              Text("Delivery Fee", style: secondary_color)
            ],
          ),

          //Delivery Time
          Column(
            children: [
              Text("10-20 min", style: primary_color),
              Text("Delivery Time", style: secondary_color)
            ],
          )
        ],
      ),
    );
  }
}