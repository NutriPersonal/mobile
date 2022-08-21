import 'package:flutter/material.dart';
import 'package:nutripersonal/config/themes/dark_theme.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/core/auth/auth/auth_screen.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriPersonal',
      theme: lightTheme,
      home: HomeScreen(),
    );
  }
}
