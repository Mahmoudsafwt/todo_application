import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/colors/todo_app_colors.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';
import 'package:todo_app/ui/theme/my_theme.dart';

import '../components/task_component.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: myProvider.isDark()
                ? MyTheme.backgroundDays
                : MyTheme.unSelectedMonth,
            dayColor: myProvider.isDark()
                ? MyTheme.backgroundDays
                : MyTheme.unSelectedMonth,
            activeDayColor: primaryColor,
            activeBackgroundDayColor: MyTheme.backgroundDays,
            dotsColor: primaryColor,
            //selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
        ),
        Expanded(
            flex: 4,
            child: ListView.builder(
                itemBuilder: (context, index) => const TaskComponent(),
                itemCount: 5))
      ],
    );
  }
}
