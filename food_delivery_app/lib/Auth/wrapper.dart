import "package:flutter/material.dart";
import "package:food_delivery_app/Auth/wrapper_provider.dart";
import "package:food_delivery_app/Pages/login_page.dart";
import "package:food_delivery_app/Pages/register_page.dart";
import "package:provider/provider.dart";
class Wrapper extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Consumer<WrapperProvider>(builder: (context, value, child){
     return value.isLoginPage? LoginPage(onTap: (){
       value.toggleBetween();
    }):RegisterPage(onTap: (){
      value.toggleBetween();
    });
    }
  );
  }
}