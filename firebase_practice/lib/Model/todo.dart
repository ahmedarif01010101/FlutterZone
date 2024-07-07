import 'package:cloud_firestore/cloud_firestore.dart';
class Todo
{
  String task;
  bool isDone;
  Timestamp createdON;
  Timestamp updatedON;

  //Constructor
  Todo({required this.task, required this.isDone, required this.createdON, required this.updatedON});

  //Named Constructor for converting JSON to Todo.
  Todo.fromjson(Map<String, dynamic> json) : this(task: json["task"] as String, 
                                                  isDone: json["isDone"] as bool,
                                                  createdON: json["createdON"] as Timestamp,
                                                  updatedON: json["updatedON"] as Timestamp);

  Todo copyWith({String? task, bool? isDone, Timestamp? createdON, Timestamp? updatedON})
  {
    return Todo(task: task?? this.task, isDone: isDone?? this.isDone, createdON: createdON?? this.createdON, updatedON: updatedON?? this.updatedON);
  }

  Map<String, Object> toJson()
  {
    return {
      "task": task,
      "isDone": isDone,
      "createdON": createdON,
      "updatedON": updatedON
    };
  }
}