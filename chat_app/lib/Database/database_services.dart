import 'package:chat_app/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String Collection_Name = "users";
class DatabaseServices 
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<UserModel> _usercollectionReference;

  DatabaseServices()
  {
    _usercollectionReference = _firestore.collection(Collection_Name).withConverter<UserModel>(fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!), toFirestore: (user, _) => user.toJson());
  }
     
  Future<void> addUser(UserModel user) async
  {
    await _usercollectionReference.add(user);
    print("The user has been added to the firestore");
  }

  Future<void> update (String userId, UserModel usermodel) async
  {
    await _usercollectionReference.doc(userId).update(usermodel.toJson());
  }


  Stream<List<UserModel?>> getUser() 
  {
    return _usercollectionReference.snapshots().map((snapshot){
      return snapshot.docs.map((doc)
      {
        return doc.data();
      }).toList();

    });
  }
}