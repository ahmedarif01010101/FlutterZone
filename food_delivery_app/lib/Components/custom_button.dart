import "package:flutter/material.dart";

class CustomButton extends StatelessWidget
{
  final String text;
  final Function() onTap;
  CustomButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(7)
            ),
            child: Text(text,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
      ),
    );
  }
}