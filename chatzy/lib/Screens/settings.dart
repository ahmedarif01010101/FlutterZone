import "package:chatzy/Authentication/auth.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:chatzy/Theme/themeswitcher.dart";
import "package:provider/provider.dart";

class Settings extends StatefulWidget
{
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context)
  {
     ThemeSwitcher _darkEnabler = Provider.of<ThemeSwitcher>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(15),
              height:110,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
              ),
              child: Row(
                children: [
                  Text("Settings", style: TextStyle(fontSize: 48),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dark Mode"),
                      CupertinoSwitch(value: _darkEnabler.isDark, 
                      onChanged: (bool){
                          _darkEnabler.toggle();
                      })
                    ],
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Text("Log Out")
                      ],
                    ),
                    onTap: (){
                      _auth.signOut();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}