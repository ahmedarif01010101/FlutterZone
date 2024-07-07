import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_practice/Auth/databaseservices.dart";
import "package:firebase_practice/Model/todo.dart";
import "package:flutter/material.dart";

class Home extends StatefulWidget
{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  final DatabaseServices _databaseServices = DatabaseServices();
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
            appBar: AppBar(
              title: Text("Todo"),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: displayDialogBox,
            ),
            body: StreamBuilder(
                stream: _databaseServices.getTodos(),
                builder: (context, snapshot)
                {
                 List _todolist = snapshot.data?.docs ?? [];
                 if(_todolist.isEmpty)
                 {
                   return Center(
                      child: Text("Add Todo"),
                   );
                 }
                 else
                 {
                  return ListView.builder(
                      itemCount: _todolist.length,
                      itemBuilder: (context, index)
                      {
                        Todo _todo = _todolist[index].data();
                        return ListTile(
                          title: Text("${_todo.task}"),
                          subtitle: Text("${_todo.createdON}"),
                          trailing: Checkbox(
                            value: _todo.isDone,
                            onChanged: (value){
                              Todo _updatedTodo = _todo.copyWith(isDone: !_todo.isDone, updatedON: Timestamp.now());
                              _databaseServices.updateTodo(_todolist[index].id, _updatedTodo);
                            }),
                        );
                      },
                  );
                 }
                 
                },
            ),
    );
  }
  Future displayDialogBox() async
  {
    return showDialog(
      context: context, 
      builder: ((context) {
        return AlertDialog(
          title: Text("Add Todo"),
          content: TextField(
            controller: _todoController,
            decoration: InputDecoration(
              hintText: "Todo"
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text("Add"),
              onPressed: (){
                Todo _todo = Todo(task: _todoController.text, isDone: false, createdON: Timestamp.now(), updatedON: Timestamp.now());
                _databaseServices.addTodo(_todo);
                Navigator.pop(context);
                _todoController.clear();
              },
            )
          ],
        );
      }));
  }
}