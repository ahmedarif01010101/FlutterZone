import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_practice/Model/todo.dart";

const String Todo_Collection_ref = "Todos";

class DatabaseServices
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todosref;

  DatabaseServices()
  {
     _todosref = _firestore.collection(Todo_Collection_ref).withConverter<Todo>(fromFirestore: ((snapshots, _) => Todo.fromjson(snapshots.data()!)), toFirestore: (todo, _) => todo.toJson());

  }

  Stream<QuerySnapshot> getTodos()
     {
      return _todosref.snapshots();
     }
  
   void addTodo(Todo todo)
     {
      _todosref.add(todo);
     }

  void updateTodo(String todoId, Todo todo)
  {
    _todosref.doc(todoId).update(todo.toJson());
  }
}