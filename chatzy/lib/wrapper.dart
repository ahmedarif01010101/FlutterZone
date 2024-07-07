import "package:chatzy/Models/usermodel.dart";
import "package:chatzy/Screens/nav.dart";
import "package:chatzy/Screens/register.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Wrapper extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Consumer<UserModel?>(builder: (context, value, child){
        print("This is ${value}");
        return value != null ? Nav() :  const register();
      }),
    );
  }
}