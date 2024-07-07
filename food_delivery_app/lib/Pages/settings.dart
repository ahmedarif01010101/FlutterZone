import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:food_delivery_app/Themes/theme_provide.dart";
import "package:provider/provider.dart";

class Settings extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            title: Text("Settings"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text("Dark Mode"),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context, listen: false).isDarkTheme, 
                    onChanged: (value){
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      })
                ],
              ),
            )
          ],
        ),
    );
  }
}