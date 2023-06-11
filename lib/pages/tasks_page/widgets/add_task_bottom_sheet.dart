
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared_components/theme/network/my_database.dart';
import 'package:todo_app/shared_components/theme/theme/color.dart';
import 'package:todo_app/shared_components/theme/utilies/my_datetime_utilies.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime taskTime=DateTime.now();
  
  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(color: theme.backgroundColor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add New Task",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: theme.accentColor),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: titleController,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter task title";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        label: Text(
                      "Task Title",
                      style: TextStyle(color: theme.accentColor),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: descriptionController,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter task describtion";
                      } else if (value.length < 10) {
                        return "description cant be less than 10 characters";
                      } else {
                        return null;
                      }
                    },
                    //  maxLength: 4,
                    //  minLines: 2,
                    decoration: InputDecoration(
                      label: Text(
                        "Task Describtion",
                        style: TextStyle(color: theme.accentColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: Text(
                    "Select Date :",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.accentColor),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showBottomDatePicker();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: theme.accentColor)),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        //selectedDate.toString().substring(0, 10),
                        MyDatetimeUtilies.formateDate(selectedDate),
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.accentColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: Text(
                    "Select Time :",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.accentColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: theme.accentColor,width: 3 )),
                    padding: const EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      normalTextStyle: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).accentColor
                      ),
                      highlightedTextStyle: TextStyle(
                          fontSize: 24,
                          color: primaryColor
                      ),
                      spacing: 50,
                      itemHeight: 80,
                      isForce2Digits: true,
                      time: taskTime,
                      onTimeChange: (time) {
                        setState(() {
                          taskTime = time;
                        });
                      },
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: theme.primaryColor,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel taskmodel = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          taskTime: taskTime,
                          dateTime: selectedDate);
                      MyDatabase.addTask(taskmodel).then((value) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  label: Text(
                    "Submit New Task",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  void showBottomDatePicker() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate == null) return;
    setState(() {
      selectedDate = DateUtils.dateOnly(chosenDate);
    });
  }

}
