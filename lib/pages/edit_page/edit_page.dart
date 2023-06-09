import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared_components/theme/network/my_database.dart';

import '../../shared_components/theme/utilies/my_datetime_utilies.dart';

class EditPage extends StatefulWidget {
  static const String routeName = "edit page";

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController? titleController;
  TextEditingController? descriptionController;
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    titleController?.dispose();
    descriptionController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    TaskModel taskModel =
        ModalRoute.of(context)?.settings.arguments as TaskModel;
    if (titleController == null || descriptionController == null) {
      titleController = TextEditingController(text: taskModel.title);
      descriptionController =
          TextEditingController(text: taskModel.description);
    }
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "To Do List",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: BoxDecoration(color: theme.backgroundColor),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.82,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Edit Task",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: theme.accentColor),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: titleController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
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
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
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
                        "Task Description",
                        style: TextStyle(color: theme.accentColor),
                      )),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Select Time :",
                        textAlign: TextAlign.start,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.accentColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          showBottomDatePicker(taskModel);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: theme.accentColor)),
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                MyDatetimeUtilies.formateDate(
                                    taskModel.dateTime),
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: theme.accentColor),
                              )),
                        )),
                    const SizedBox(
                      height: 55,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: theme.primaryColor,
                      ),
                      onPressed: () {
                        if (formKey.currentState != null && formKey.currentState!.validate()) {
                          taskModel.title = titleController!.text;
                          taskModel.description = descriptionController!.text;
                          MyDatabase.updateTask(taskModel);
                          //settingProvider.editTask(taskModel);
                        }
                      },
                      label: Text(
                        "save changes",
                        textAlign: TextAlign.end,
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
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
        )));
  }

  void showBottomDatePicker(TaskModel taskModel) async {
    DateTime? chosenDate = await showDatePicker(
            context: context,
            initialDate: taskModel.dateTime,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) {
      if (value != null) {
        taskModel.dateTime = value;
      }
    });
    if (chosenDate == null) return;
    setState(() {
      taskModel.dateTime = DateUtils.dateOnly(chosenDate);
    });
  }
}
