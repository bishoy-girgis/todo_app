import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/pages/tasks_page/widgets/task_items.dart';
import 'package:todo_app/shared_components/theme/network/my_database.dart';
import 'package:todo_app/shared_components/theme/theme/color.dart';

class TasksPage extends StatefulWidget {
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  DateTime selectedDate =DateUtils.dateOnly(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          dayNameColor: primaryColor,
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date)
          //=> print(date),
          {
            selectedDate = DateUtils.dateOnly(date);
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: primaryColor,
          dayColor: Theme.of(context).accentColor,
          activeDayColor: primaryColor,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: primaryColor,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: MyDatabase.getTask(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "something went wrong",
                style: Theme.of(context).textTheme.headlineMedium,
              ));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<TaskModel> tasksList =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return tasksList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: tasksList.length,
                      itemBuilder: (context, index) =>
                          TaskItems(tasksList[index]),
                    ),
                  )
                : Center(
                    child: Text(
                      "No Tasks Found ... ",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
          },
        ),
      ],
    );
  }
}
