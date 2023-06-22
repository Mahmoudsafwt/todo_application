import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/home_screen.dart';
import 'package:todo_app/ui/settings_provider/sett_provider.dart';
import 'package:todo_app/ui/splash_screen/splash_screen.dart';
import 'package:todo_app/ui/theme/my_theme.dart';

// void main() {
//   runApp(const ToDoApp());
// }

void main() => runApp(ChangeNotifierProvider(
    create: (context) => SettingsProvider(), child: const ToDoApp()));

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingProvider.currentMode,
    );
  }
}
