import 'package:flutter/material.dart';
import 'package:todo_app/ui/home_screen.dart';
import 'package:todo_app/ui/splash_screen/splash_screen.dart';
import 'package:todo_app/ui/theme/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
