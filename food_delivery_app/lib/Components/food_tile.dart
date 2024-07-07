import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:food_delivery_app/Models/food.dart";

class FoodTile extends StatelessWidget
{
  final Food food;
  final Function()? onTap;

  FoodTile({required this.food, required this.onTap});
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children:[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text("\$${food.price.toString()}", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      SizedBox(height: 7,),
                      Text(food.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                    ],
                  )),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset(food.imagePath, height: 85,))
              ]),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                indent: 25,
                endIndent: 25,
              )
          ],
        ),
      ),
    );
  }
}