import 'package:flutter/material.dart';
import 'package:nutripersonal/core/settings/settings_screen.dart';
import 'package:nutripersonal/screens/chatbot/chatbot_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_header_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_nav_item_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Início',
                            iconName: Icons.home,
                            screen: const HomeScreen(),
                          ),
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'ChatBot',
                            iconName: Icons.chat,
                            screen: const ChatBotScreen(),
                          ),
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Settings',
                            iconName: Icons.settings,
                            screen: const SettingsScreen(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Suporte "),
                  Text("GitHub "),
                  Text("Instagram"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
