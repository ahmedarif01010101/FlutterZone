import "package:chatzy/Models/chatroom.dart";
import "package:chatzy/Models/message.dart";
import "package:cloud_firestore/cloud_firestore.dart";
class Chatservice
{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late DocumentReference _roomRef;
  late List<String> _userIds;
  late String roomId;
  late CollectionReference _messagesRef;

  Chatservice(String senderId, String recieverId)
  {
    _userIds = [senderId, recieverId];
    _userIds.sort();
    String roomId = "${_userIds[0]}_${_userIds[1]}";
    _roomRef = _firestore.collection("chatRooms").doc(roomId).withConverter<ChatRoom>(fromFirestore: (snapshots,_) => ChatRoom.fromJson(snapshots.data()!), toFirestore: (chatroom, _)=> chatroom.toJson());
    _messagesRef = _roomRef.collection("messages").withConverter<Message>(fromFirestore: (snapshots, _)=> Message.fromJson(snapshots.data()!), toFirestore: (message, _)=> message.toJson());
  }

  Future<String> getOrCreateRoom() async
  {

    DocumentSnapshot _roomSnapshot = await _roomRef.get();

    if(!_roomSnapshot.exists)
    {
      await _roomRef.set(ChatRoom(
        participants: _userIds, 
        lastMessage: "", 
        lastMessageTimeStamp: FieldValue.serverTimestamp() as Timestamp));
    }

    return roomId;
  }

 Future<void> sendMessages(Message message, ChatRoom chatroom) async
 {
    await _messagesRef.add(message);
    await _roomRef.update(chatroom.toJson());
 }

  Stream<QuerySnapshot> getMessages() => _messagesRef.orderBy("contentTimeStamp").snapshots();

}