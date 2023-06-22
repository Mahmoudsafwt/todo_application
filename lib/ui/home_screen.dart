import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';
import 'package:todo_app/ui/settings_screen/setting_screen.dart';
import 'package:todo_app/ui/tasks_screen/tasks_screen.dart';

import 'components/bottom_sheet_components.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  List<Widget> myScreens = [
    TasksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SettingsProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myProvider.darkbackGroundColor(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.19),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                top: height * 0.04),
            child: Text(
              'To Do List',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: myProvider.isDark() ? Colors.black : Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentSelectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
          currentIndex: currentSelectedIndex,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: StadiumBorder(
            side: myProvider.currentMode == ThemeMode.light
                ? const BorderSide(color: Colors.white, width: 3.5)
                : BorderSide.none),
        child: const Icon(Icons.add),
      ),
      body: myScreens[currentSelectedIndex],
    );
  }

  void showAddTaskBottomSheet() {
    var myProvider = Provider.of<SettingsProvider>(context, listen: false);

    showModalBottomSheet(
      backgroundColor: myProvider.isDark() ? Colors.black87 : Colors.white,
      context: context,
      builder: (context) => BottomSheetComponents(),
    );
  }
}
