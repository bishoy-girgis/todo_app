class TaskModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  DateTime taskTime;
  bool isDone;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.dateTime,
        required this.taskTime,
      this.isDone = false});

  TaskModel.fromFireStore(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          dateTime: DateTime.fromMicrosecondsSinceEpoch(json["datetime"]),
          taskTime: DateTime.fromMillisecondsSinceEpoch(json["tasktime"]),
          isDone: json["isDone"],
        );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "datetime": dateTime.microsecondsSinceEpoch,
      "isDone": isDone,
      "tasktime":taskTime.millisecondsSinceEpoch
    };
  }
}
