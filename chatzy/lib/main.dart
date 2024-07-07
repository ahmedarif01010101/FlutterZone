import 'package:chatzy/Authentication/auth.dart';
import 'package:chatzy/Database/database_services.dart';
import 'package:chatzy/Models/usermodel.dart';
import 'package:chatzy/Screens/chatscreen.dart';
import 'package:chatzy/Theme/themeswitcher.dart';
import 'package:chatzy/wrapper.dart';
import 'package:provider/provider.dart';
import 'Screens/nav.dart';
import 'Screens/getstarted.dart';
import 'Screens/login.dart';
import 'Screens/register.dart';
import 'Screens/routes.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyCyvXB65KHyxLVzxJbUnDjsRcDWlpIC1dY", 
    appId: "1:1011317621010:android:a1f5df146c04b780b2f3cb",
    messagingSenderId: "1011317621010",
    storageBucket: "chatzy-52fa1.appspot.com", 
    projectId: "chatzy-52fa1"));
  
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true
  );

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
             "/":(context)=>GetStarted(),
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


