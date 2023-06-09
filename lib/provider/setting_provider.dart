import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared_components/theme/network/my_database.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocal = "en";

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;

    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String getThemeName() {
    return currentTheme == ThemeMode.dark ? "Dark" : "Light";
  }

  void changeLocal(String newLocal) {
    if (newLocal == currentLocal) return;
    currentLocal = newLocal;
    notifyListeners();
  }
  void editTask(TaskModel taskModel){
    MyDatabase.updateTask(taskModel).then((value) {
      print("Task edited");
      notifyListeners();
    });
  }
}
