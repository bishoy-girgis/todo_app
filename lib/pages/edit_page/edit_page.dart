import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  static const String routeName = "edit page";

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "To Do List",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        ),
        body: Container(
          decoration: BoxDecoration(color: theme.backgroundColor),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
                      "this is title",
                      style: TextStyle(color: theme.accentColor),
                    )),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
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
                      "Task Details",
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
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        showBottomDatePicker();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: theme.accentColor)),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "9/5/2023",
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: theme.accentColor),
                            )),
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton.icon(
                      icon: Icon(
                        Icons.check_circle_outline,
                        color: theme.primaryColor,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("text is valid");
                        }
                      },
                      label: Text(
                        textAlign: TextAlign.end,
                        "save changes",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.primaryColor),
                      )),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void showBottomDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
  }
}
