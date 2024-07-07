import "package:chat_app/Authentication/auth.dart";
import "package:chat_app/Chat/chatservice.dart";
import "package:chat_app/Models/chatroom.dart";
import "package:chat_app/Models/message.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class ChatScreen extends StatefulWidget
{
  @override
  State<ChatScreen> createState() => _ChatScreen();
}
class _ChatScreen extends State<ChatScreen>
{
  @override
  Widget build(BuildContext context)
  {
    Auth _auth = Auth();
    List? contactData = ModalRoute.of(context)!.settings.arguments as List?;
    int index = _auth.currentUser()!.email!.indexOf("@");
    String _senderUsername = _auth.currentUser()!.email!.substring(0, index);
    ChatService _chatService = ChatService(_auth.currentUser()!.uid, contactData![1].id);
    TextEditingController _messageController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                             Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios), 
                          color: Color.fromRGBO(255, 0, 0, 100),
                          onPressed: (){
                            Navigator.pop(context);
                          },),
                        Spacer(flex: 1),
                        Icon(Icons.person),
                        SizedBox(width: 5),
                        Text(contactData[0]),
                        Spacer(flex:6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Container(
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(top: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
            ),
            child: Row(
              children: [
                Icon(Icons.add),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Send Message",
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.tertiary,
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.black)),
                      contentPadding: EdgeInsets.all(10)
                    ),
                    cursorColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width:5),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send_rounded),
                  ),
                  onTap: ()async{
                      Message _message = Message(senderName: _senderUsername, recieverName: contactData[0], content: _messageController.text, contentTimeStamp: Timestamp.now());
                      List _sortedUserIds = await _chatService.getOrCreateRoom();
                      print("sorted user Ids are: $_sortedUserIds");
                      ChatRoom _chatRoom = ChatRoom(participants: _sortedUserIds, lastMessage: _messageController.text, lastMessageTimeStamp: Timestamp.now());
                      await _chatService.sendMessages(_message, _chatRoom);

                  },
                )
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}