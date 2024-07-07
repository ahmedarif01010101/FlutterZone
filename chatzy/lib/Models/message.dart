import 'package:cloud_firestore/cloud_firestore.dart';

class Message
{
  String? senderName;
  String? recieverName;
  String? content;
  Timestamp? contentTimeStamp;

  Message({
    required this.senderName, 
    required this.recieverName, 
    required this.content,
    required this.contentTimeStamp});
  
  Message.fromJson(Map<String, dynamic> json)
  : this(
    senderName: json["senderName"],
    recieverName: json["recieverName"],
    content: json["content"],
    contentTimeStamp: json["contentTimeStamp"]
  );

  Map<String, dynamic> toJson()
  {
    return 
    {
      "senderName": senderName,
      "recieverName": recieverName,
      "content": content,
      "contentTimeStamp": contentTimeStamp
    };
  }
}