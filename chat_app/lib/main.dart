import "package:chat_app/Authentication/auth.dart";
import "package:chat_app/Database/database_services.dart";
import "package:chat_app/Models/usermodel.dart";
import "package:chat_app/Screens/chatscreen.dart";
import "package:chat_app/Screens/login.dart";
import "package:chat_app/Screens/nav.dart";
import "package:chat_app/Screens/register.dart";
import "package:chat_app/Screens/routes.dart";
import "package:chat_app/Theme/themeswitcher.dart";
import "package:chat_app/wrapper.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:provider/provider.dart";
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyD0iucXAY6SBqTOojnjsl79_uMWJwS1ZOI",
    appId: "1:781252629919:android:5ff8b7819c6c73d29759aa",
    messagingSenderId: "781252629919",
    projectId: "chatapp-1241d",
    storageBucket: "chatapp-1241d.appspot.com",
  ));
 
 runApp(
    MultiProvider(providers:[
      StreamProvider<UserModel?>.value(value: Auth().streamUser, initialData: null),
      StreamProvider<List<UserModel?>>.value(value: DatabaseServices().getUser(), initialData: []),
      ChangeNotifierProvider(create: (context) => ThemeSwitcher())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeSwitcher>(context).theme,
      routes:{
             "/":(context)=>Wrapper(),
             Myroute.loginroute:(context)=>Login(),
             Myroute.regiterroute:(context)=>register(),
             Myroute.navroute:(context)=>Nav(),
             Myroute.wrapper:(context)=>Wrapper(),
             Myroute.chatscreen:(context) => ChatScreen()
    },
    initialRoute: Myroute.wrapper,
    );
  }
}