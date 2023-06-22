import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/colors/todo_app_colors.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Slidable(
      startActionPane:
          ActionPane(extentRatio: 0.6, motion: BehindMotion(), children: [
        SlidableAction(
          onPressed: (context) {},
          label: 'Delete',
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        SlidableAction(
          onPressed: (context) {},
          label: 'edit',
          icon: Icons.edit,
          backgroundColor: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
      ]),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.05),
        decoration: BoxDecoration(
            color: myProvider.darkbackGroundColor(),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              width: width * 0.01,
              height: height * 0.08,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(6)),
            ),
            Column(
              children: [
                Text(
                  'Play basket ball',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: myProvider.currentMode == ThemeMode.light
                          ? Colors.black54
                          : Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.18),
                      child: Text(
                        '10:30 AM',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: myProvider.currentMode == ThemeMode.light
                                ? Colors.black54
                                : Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: width * 0.16,
              height: height * 0.05,
              margin: EdgeInsets.only(left: width * 0.25),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
              child: Icon(
                Icons.done,
                size: 35,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
