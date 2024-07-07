import "package:firebase_practice/firebase_options.dart";
import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "Screens/signup.dart";
Future<void> main () async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build (BuildContext context)
  {
    return MaterialApp(
          home: SignUp()
    );
  }
}