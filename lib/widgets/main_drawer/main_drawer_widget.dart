import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/core/auth/sign_in/sign_in_screen.dart';
import 'package:nutripersonal/core/auth/sign_up/sign_up_screen.dart';
import 'package:nutripersonal/core/settings/settings_screen.dart';
import 'package:nutripersonal/screens/chatbot/chatbot_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_header_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_nav_item_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key, required this.screenId}) : super(key: key);
  final int screenId;

  @override
  Widget build(BuildContext context) {
    const name = 'Bruno Ferreira';
    const email = 'dev.nutripersonal@gmail.com';
    const urlImage = 'https://avatars.githubusercontent.com/u/76089674?v=4';

    return Drawer(
      child: Material(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    const MainDrawerHeaderWidget(
                      name: name,
                      email: email,
                      urlImage: urlImage,
                    ),
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 300,
                      padding: const EdgeInsets.only(right: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MainDrawerNavItemWidget(
                              context: context,
                              labelText: 'Início',
                              iconName: Icons.home,
                              screen: const HomeScreen(),
                              selected: screenId == 0,
                            ),
                            const SizedBox(height: 8),
                            MainDrawerNavItemWidget(
                              context: context,
                              labelText: 'ChatBot',
                              iconName: Icons.chat,
                              screen: const ChatBotScreen(),
                              selected: screenId == 1,
                            ),
                            const SizedBox(height: 8),
                            MainDrawerNavItemWidget(
                              context: context,
                              labelText: 'Settings',
                              iconName: Icons.settings,
                              screen: const SettingsScreen(),
                              selected: screenId == 2,
                            ),
                            const SizedBox(height: 8),
                            MainDrawerNavItemWidget(
                              context: context,
                              labelText: 'Sign in',
                              iconName: Icons.login,
                              screen: SignInScreen(),
                              selected: screenId == AppConstants.SignInScreenId,
                            ),
                            const SizedBox(height: 8),
                            MainDrawerNavItemWidget(
                              context: context,
                              labelText: 'Sign up',
                              iconName: Icons.create,
                              screen: SignUpScreen(),
                              selected: screenId == AppConstants.SignUpScreenId,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Suporte ",
                        style: TextStyle(color: Color(0xff117c6f)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "GitHub ",
                        style: TextStyle(color: Color(0xff117c6f)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Instagram ",
                        style: TextStyle(color: Color(0xff117c6f)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "v1.0.0",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
