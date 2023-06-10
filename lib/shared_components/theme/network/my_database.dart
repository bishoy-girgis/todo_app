import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/task_model.dart';

class MyDatabase {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection("Task")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromFireStore(snapshot.data()!),
          toFirestore: (taskModel, options) => taskModel.toFireStore(),
        );
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collectionRef = getCollection();
    var doc = collectionRef.doc();
    taskModel.id = doc.id;
    return doc.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    print(dateTime.microsecondsSinceEpoch);
    var collection = getCollection();

    return collection
        .where("datetime", isEqualTo: dateTime.microsecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id){
    var collection =getCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateTask(TaskModel taskModel){
    var collection=getCollection();
    return collection.doc(taskModel.id).update(taskModel.toFireStore());
  }
}
// Are You sure you Want to Delete this Task ?