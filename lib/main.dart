import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutripersonal/config/themes/dark_theme.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/core/auth/auth/auth_screen.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/screens/chatbot/chatbot_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/screens/splash/splash_screen.dart';
import 'package:nutripersonal/utils/services/firebase_auth_service.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAuthService.firebaseApp();
  runApp(const NutriPersonal());
}

class NutriPersonal extends StatefulWidget {
  const NutriPersonal({Key? key}) : super(key: key);

  @override
  State<NutriPersonal> createState() => _NutriPersonalState();
}

class _NutriPersonalState extends State<NutriPersonal> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  _NutriPersonalState() {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   print(user);
    //   if (user == null) {
    //     _navigatorKey.currentState?.push(
    //       MaterialPageRoute(
    //         builder: (builder) => const HomeScreen(),
    //       ),
    //     );
    //   } else {
    //     _navigatorKey.currentState?.push(
    //       MaterialPageRoute(
    //         builder: (builder) => SignUpScreen(),
    //       ),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriPersonal',
      theme: lightTheme,
      home: SplashScreen(),
      navigatorKey: _navigatorKey,
    );
  }
}
