import 'package:flutter/material.dart';
import 'package:todo_app/ui/settings_screen/setting_screen.dart';
import 'package:todo_app/ui/tasks_screen/tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  List<Widget> myScreens = const [
    SettingsScreen(),
    TasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
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
        onPressed: () {},
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.white, width: 3.5)),
        child: const Icon(Icons.add),
      ),
      body: myScreens[currentSelectedIndex],
    );
  }
}
