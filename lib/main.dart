import 'package:flutter/material.dart';
import 'package:nutripersonal/config/themes/dark_theme.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriPersonal',
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
