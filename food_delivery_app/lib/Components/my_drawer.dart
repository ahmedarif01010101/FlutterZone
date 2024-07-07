import "package:flutter/material.dart";
import "package:food_delivery_app/Pages/settings.dart";
import "./drawer_tile.dart";
class MyDrawer extends StatelessWidget
{
  @override 
  Widget build(BuildContext context)
  {
    return Drawer(
          child: SafeArea(
                child: Column(
                  children: [
                    Icon(
                      Icons.lock_open_outlined,
                      size: 80,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Divider(
                        color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
               DrawerTile(
                text: "Home", 
                icon: Icons.home_outlined, 
                onTap: (){}),

                DrawerTile(
                text: "About", 
                icon: Icons.info_outline, 
                onTap: (){}),

                DrawerTile(
                text: "Settings", 
                icon: Icons.settings_outlined, 
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                }),


              ]
            ),
          ),
    );
  }
}