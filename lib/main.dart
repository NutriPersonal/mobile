import 'package:flutter/material.dart';
import 'package:nutripersonal/config/themes/dark_theme.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/core/auth/auth/auth_screen.dart';
import 'package:nutripersonal/core/auth/login/login_screen.dart';
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
      title: 'NutriPersonal',
      theme: lightTheme,
      home: AuthScreen(),
    );
  }
}
