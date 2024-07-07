import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom 
{
  List? participants;
  String? lastMessage;
  Timestamp? lastMessageTimeStamp; 

  ChatRoom({required this.participants, required this.lastMessage, required this.lastMessageTimeStamp});

  ChatRoom.fromJson(Map<String, dynamic> json)
  :this(
    participants: json["participants"],
    lastMessage: json["lastMessage"],
    lastMessageTimeStamp: json["lastMessageTimeStamp"]
  );
  
   ChatRoom copyWith(String updatedlastMessage, Timestamp updatedlastMessageTimeStamp)
  {
    return ChatRoom(
    participants: participants, 
    lastMessage: lastMessage ?? updatedlastMessage, 
    lastMessageTimeStamp: lastMessageTimeStamp ?? updatedlastMessageTimeStamp);
  }

  Map<String, dynamic> toJson() => {
      "participants": participants,
      "lastMessage": lastMessage,
      "lastMessageTimestamp": lastMessageTimeStamp
    };
}