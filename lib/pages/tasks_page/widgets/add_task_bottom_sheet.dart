import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();

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
                const SizedBox(height: 20),
                TextFormField(
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
                const SizedBox(height: 15),
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
                    "Task Describtion",
                    style: TextStyle(color: theme.accentColor),
                  )),
                ),
                const SizedBox(height: 15),
                Container(
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

  void showBottomDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
  }
}
