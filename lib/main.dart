import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutripersonal/config/themes/dark_theme.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/core/auth/auth/auth_screen.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/screens/chatbot/chatbot_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/screens/nutritionists/nutritionists_screen.dart';
import 'package:nutripersonal/screens/profile/profile_screen.dart';
import 'package:nutripersonal/screens/splash/splash_screen.dart';
import 'package:nutripersonal/utils/services/firebase_auth_service.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vrouter/vrouter.dart';
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
  bool isAuthenticated = false;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          isAuthenticated = false;
        });
      } else {
        setState(() {
          isAuthenticated = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'NutriPersonal',
      theme: lightTheme,
      navigatorKey: _navigatorKey,
      initialUrl: '/splash',
      routes: [
        VGuard(
          beforeEnter: (VRedirector) async =>
              isAuthenticated ? VRedirector.to('/home') : null,
          stackedRoutes: [
            VWidget(path: '/sign-in', widget: SignInScreen()),
            VWidget(path: '/sign-up', widget: SignInScreen()),
          ],
        ),
        VGuard(
          beforeEnter: (VRedirector) async =>
              isAuthenticated ? null : VRedirector.to('/sign-in'),
          stackedRoutes: [
            VWidget(path: '/home', widget: const HomeScreen()),
            VWidget(path: '/profile', widget: const ProfileScreen()),
            VWidget(
                path: '/nutritionists', widget: const NutritionistsScreen()),
            VWidget(path: '/chatbot', widget: const ChatBotScreen()),
            VWidget(path: '/settings', widget: const ChatBotScreen()),
          ],
        ),
        VGuard(
          afterEnter: (context, from, to) async =>
              isAuthenticated ? context.vRouter.to('/home') : null,
          stackedRoutes: [
            VWidget(path: '/splash', widget: const SplashScreen()),
          ],
        ),
      ],
    );
  }
}
