import 'package:chatzy/Screens/chats.dart';
import 'package:chatzy/Screens/settings.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget
{
  State<StatefulWidget> createState() => _Nav();
}

class _Nav extends State<StatefulWidget>
{
  int navIndex = 0;
  List<Widget> _screens = [
    Chats(),
    Settings()
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home), label: "Home"),
          
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings")
        ],
      selectedIndex: navIndex,
      onDestinationSelected: (index){
        setState((){
          navIndex = index;
        });
      },
      backgroundColor: Theme.of(context).colorScheme.surface,
      indicatorColor: Theme.of(context).colorScheme.primary,
      ),
    body: IndexedStack(
      children: _screens,
      index: navIndex,
    ),
    );
  }
}