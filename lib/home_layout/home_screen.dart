import 'package:flutter/material.dart';
import 'package:todo_app/pages/settings_page/settings_page.dart';
import 'package:todo_app/pages/tasks_page/tasks_page.dart';
import 'package:todo_app/shared_components/theme/theme/color.dart';
import '../pages/tasks_page/widgets/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  List<Widget> screens = [TasksPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: screens[currentSelectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white, width: 4),
        ),
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        notchMargin: 8.0,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                currentSelectedIndex = index;
              });
            },
            currentIndex: currentSelectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 22,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 22,
                  ),
                  label: ""),
            ]),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
