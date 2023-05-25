import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class MyDatabase {

  static CollectionReference<TaskModel> getCollection(){
    return FirebaseFirestore.instance.collection("Task").withConverter<TaskModel>(
      fromFirestore: (snapshot, _) => TaskModel.fromFireStore(snapshot.data()!),
      toFirestore: (taskModel, options) => taskModel.toFireStore(),
    );
  }
  static Future<void> addTask(TaskModel taskModel) {
    var collectionRef= getCollection();
    var doc =collectionRef.doc();
    taskModel.id=doc.id;
    return collectionRef.add(taskModel);
  }
  static Future<QuerySnapshot<TaskModel>> getTask(){
    var collection=getCollection();
    return collection.get();
  }

}
