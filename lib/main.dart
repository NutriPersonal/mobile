import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:nutripersonal/config/themes/light_theme.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/core/settings/settings_screen.dart';
import 'package:nutripersonal/screens/chatbot/chatbot_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/screens/nutritionists/nutritionists_screen.dart';
import 'package:nutripersonal/screens/profile/profile_screen.dart';
import 'package:nutripersonal/screens/splash/splash_screen.dart';
import 'package:nutripersonal/utils/entities/user_entity.dart';
import 'package:nutripersonal/utils/services/auth_service.dart';
import 'package:nutripersonal/utils/services/firebase_auth_service.dart';
import 'package:nutripersonal/utils/services/secure_storage_service.dart';
import 'package:vrouter/vrouter.dart';

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
  final SecureStorageService _secureStorageService = SecureStorageService();
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user == null) {
          setState(() {
            isAuthenticated = false;
            // context.vRouter.to('/sign-in');
          });
        } else {
          setState(() {
            isAuthenticated = true;
            // context.vRouter.to('/home');
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return VRouter(
      debugShowCheckedModeBanner: false,
      title: 'NutriPersonal',
      theme: lightTheme,
      navigatorKey: _navigatorKey,
      initialUrl: '/splash',
      routes: [
        VGuard(
          beforeEnter: (_) async => isAuthenticated ? _.to('/home') : null,
          stackedRoutes: [
            VWidget(path: '/sign-in', widget: SignInScreen()),
            VWidget(path: '/sign-up', widget: SignUpScreen()),
          ],
        ),
        VGuard(
          beforeEnter: (_) async => isAuthenticated ? null : _.to('/sign-in'),
          stackedRoutes: [
            VWidget(
              path: '/home',
              widget: const HomeScreen(),
            ),
            VWidget(
              path: '/profile',
              widget: const ProfileScreen(),
            ),
            VWidget(
              path: '/nutritionists',
              widget: const NutritionistsScreen(),
            ),
            VWidget(
              path: '/chatbot',
              widget: const ChatBotScreen(),
            ),
            VWidget(
              path: '/settings',
              widget: const SettingsScreen(),
            ),
          ],
        ),
        VGuard(
          afterEnter: (_, __, ___) async => isAuthenticated
              ? _.vRouter.to('/home')
              : _.vRouter.to('/sign-in'),
          stackedRoutes: [
            VWidget(
              path: '/splash',
              widget: const SplashScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
