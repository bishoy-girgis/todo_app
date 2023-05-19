import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class MyDatabase {

  CollectionReference getCollection(){
    return FirebaseFirestore.instance.collection("Task").withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => TaskModel.toFireStore(),
    );
  }
  void InsertToFireStore(TaskModel taskModel) {
    var taskCollection= getCollection();
    taskCollection.add(taskModel);
  }
}
