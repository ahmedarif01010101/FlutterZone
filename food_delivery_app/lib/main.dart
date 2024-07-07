import "package:flutter/material.dart";
import "package:food_delivery_app/Auth/wrapper.dart";
import "package:food_delivery_app/Auth/wrapper_provider.dart";
import "package:provider/provider.dart";
import "Themes/theme_provide.dart";
import "Models/restaurant.dart";

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider()),
      ChangeNotifierProvider(
        create: (context) => WrapperProvider()),
      ChangeNotifierProvider(create: (context) => Restaurant())
    ],
    child: MyApp())
  );
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themedata,
          home: Wrapper()
    );
    
  }
}