import "package:flutter/material.dart";
import "package:food_delivery_app/Components/custom_button.dart";
import "package:food_delivery_app/Models/food.dart";

class FoodPage extends StatefulWidget
{
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({required this.food})
  {
      for(Addon addon in food.availableAddons)
      {
        selectedAddons[addon] = false;
      }
      
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children: [
        Scaffold(
      body: Column(
        children: [
          //Image
          Image.asset(widget.food.imagePath),
      
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.food.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    
                Text("\$${widget.food.price.toString()}", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 15),),
                    
                SizedBox(height: 10,),
                    
                Text(widget.food.description),
                
                SizedBox(height: 10,),
                    
                Text("Add-ons", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16, fontWeight: FontWeight.bold),),
                //Addons.
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color:Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(8)
                    ),
                  child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index){
                      return CheckboxListTile(
                        title: Text(widget.food.availableAddons[index].name),
                        subtitle: Text("\$${widget.food.availableAddons[index].price.toString()}"),
                        value: widget.selectedAddons[widget.food.availableAddons[index]], 
                        onChanged: (bool? value){
                              setState(() {
                                widget.selectedAddons[widget.food.availableAddons[index]] = value!;
                              });
                        });
                  }),
                ),
              ],
            ),
          ),
        Spacer(),
        CustomButton(text:"Add To Cart", onTap: (){})
        ],
       )
      ),
     SafeArea(
       child: Opacity(
         opacity: 0.8,
         child: Container(
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,),
            onPressed: (){
              Navigator.pop(context);
            },
          )
         ),
       ),
     )
    ],
    );
  }
}