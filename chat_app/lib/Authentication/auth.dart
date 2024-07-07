import "package:chat_app/Models/usermodel.dart";
import "package:firebase_auth/firebase_auth.dart";
class Auth
{
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserModel?> Register(String email, String password) async
  {
    try
    {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _credential.user;
      return getUser(user);
    }
    catch(e)
    {
      print(e);
      return null;
    }
  }

   UserModel? getUser(User? user)
 {
    return user != null? UserModel(id: user.uid, email: user.email,isSelected: false) : null;
 }

 Stream<UserModel?> get streamUser => _auth.authStateChanges().map((User? user) => getUser(user));

 void signOut()
 {
   _auth.signOut();
 }

 User? currentUser() => _auth.currentUser;
 

}

