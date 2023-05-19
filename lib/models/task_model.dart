class TaskModel{
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.isDone});

  TaskModel.fromFireStore(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          dateTime:
              DateTime.fromMicrosecondsSinceEpoch(json["datetime"]),
          isDone: json["isDone"],
        );

  static Map<String,dynamic> toFireStore(){
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "datetime" : dateTime.microsecondsSinceEpoch ,
      "isDone" : isDone
    };
  }
}