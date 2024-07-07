import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget
{
   final String text;
   final TextEditingController controller;
   final bool obscureText;
   CustomTextField({required this.text, required this.controller, required this.obscureText});
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          )
        )
      ),
    );
  }
}