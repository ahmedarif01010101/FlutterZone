import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_practice/Model/user.dart";

class AuthServices
{
  final FirebaseAuth _auth  = FirebaseAuth.instance;

  Future<MyUser?> signUp (String email, String password) async
  {
    try
    {
      final UserCredential result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return getUser(result.user);
    }
    catch(e)
    {
      print("The error is: $e");
      return null;
    }
  }

  MyUser? getUser (User? user)
  {
    return user != null? MyUser(uid: user.uid) : null;
  }
}