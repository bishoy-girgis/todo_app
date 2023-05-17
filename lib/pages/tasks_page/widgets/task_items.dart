import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/edit_page/edit_page.dart';
import 'package:todo_app/provider/setting_provider.dart';
import 'package:todo_app/shared_components/theme/color.dart';

class TaskItems extends StatefulWidget {
  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
//  bool isChanged= true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(16)),
      child: Slidable(
        startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.delete,
                label: "Delete",
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)),
              ),
            ]),
        endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      Navigator.pushNamed(context, EditPage.routeName);
                    });
                  },
                  icon: Icons.edit,
                  label: "Edit",
                  backgroundColor: Colors.amber,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(14),
                      bottomRight: Radius.circular(14))),
            ]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 75,
                decoration: BoxDecoration(
                    color: settingsProvider.isChanged
                        ? primaryColor
                        : Colors.green,
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Play BasketBall",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: settingsProvider.isChanged
                              ? primaryColor
                              : Colors.green),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: theme.accentColor,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "10:30 AM",
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      settingsProvider.isChanged = false;
                    });
                  },
                  child: settingsProvider.isChanged
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: const Icon(
                            Icons.check,
                            size: 35,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14)),
                          child: Text("Done!",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.green)),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
