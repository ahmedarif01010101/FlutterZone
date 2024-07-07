import "package:chat_app/Authentication/auth.dart";
import "package:chat_app/Database/database_services.dart";
import "package:chat_app/Models/usermodel.dart";
import "package:chat_app/Screens/routes.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Chats extends StatefulWidget
{
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final DatabaseServices _database = DatabaseServices();
  bool _selectAll = false;
  Auth _auth = Auth();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 190,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.inversePrimary))
              ),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Chats", style: TextStyle(fontSize: 48, fontFamily: "Arial Rounded MT Bold", fontWeight: FontWeight.bold),),
                        CircleAvatar(
                          child: Icon(Icons.add_a_photo,),),
                      ]),
                  ),

                  SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                      Expanded(
                        child:TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search, color: Colors.black, ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.tertiary,
                            hintStyle: TextStyle(fontStyle: FontStyle.italic),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),borderRadius: BorderRadius.circular(20)),
                            contentPadding: EdgeInsets.all(10),
                            
                          ),
                        )),
                        
                        IconButton(
                          icon: Icon(Icons.add_box, color: Theme.of(context).colorScheme.secondary,),
                          onPressed: (){},),
                        IconButton(
                          icon: Icon(Icons.select_all_outlined),
                          onPressed: (){
                            setState((){
                              _selectAll = !_selectAll;
                            });
                          },),
                      ],),
                  )
                ],
              ),
            ),
            SizedBox(height:20),
            Expanded(
              child: Consumer<List<UserModel?>>(
                builder: (context, value, child){
                  List<UserModel?> userData = value;
                  print("This is $userData");
                  return value.isNotEmpty?
                  ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index){
                    UserModel? _user = userData[index];
                    if(_user!.email != _auth.currentUser()!.email)
                    {
                    print(_auth.currentUser()!.uid);
                    print(_user.id);
                    int _indexof = _user.email!.indexOf("@");
                    String _username = _user.email!.substring(0, _indexof);
                    print("The username is: $_username");
                    return  
                  _selectAll?ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(_username),
                    trailing:Checkbox(
                      value: _user.isSelected,
                      onChanged: (value) async {
                          UserModel _updatedUser = _user.copyWith(!_user.isSelected);
                          await _database.update(_user.id!, _updatedUser);
                    },)
                  )
                :InkWell(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(_username),
                  ),
                onTap: (){
                  Navigator.pushNamed(context, Myroute.chatscreen, arguments: [_username, _user]);
                },
                );
                }
                    return null;},) : Center(
                          child: Text("No Users"),
                        );
                },
                
              ),
            ),
      ])),
    );
  }
}
