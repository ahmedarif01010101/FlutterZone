import "package:flutter/material.dart";

class DrawerTile extends StatelessWidget
{
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  DrawerTile({required this.text, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}