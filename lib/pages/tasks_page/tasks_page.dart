import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/tasks_page/widgets/task_items.dart';
import 'package:todo_app/shared_components/theme/color.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          dayNameColor: lightGreenColor,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: primaryColor,
          dayColor: Theme.of(context).accentColor,
          activeDayColor: primaryColor,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: lightGreenColor,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return TaskItems();
            },
          ),
        ),
      ],
    );
  }
}
