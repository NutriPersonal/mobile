import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/utils/entities/user_entity.dart';
import 'package:nutripersonal/utils/services/auth_service.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_header_widget.dart';
import 'package:nutripersonal/widgets/main_drawer/main_drawer_nav_item_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vrouter/vrouter.dart';

class MainDrawerWidget extends StatelessWidget {
  MainDrawerWidget({Key? key, required this.screenId}) : super(key: key);
  final UserEntity _userEntity = AuthService.currentUser();
  final Uri _uri = Uri();
  final int screenId;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  MainDrawerHeaderWidget(
                    name: _userEntity.name,
                    email: _userEntity.email,
                    urlImage: _userEntity.photoUrl,
                  ),
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 20),
                    // height: 300,
                    padding: const EdgeInsets.only(right: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Início',
                            iconName: Icons.home,
                            route: '/home',
                            selected: screenId == 0,
                          ),
                          const SizedBox(height: 8),
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Conversar',
                            iconName: Icons.chat,
                            route: '/chatbot',
                            selected: screenId == 1,
                          ),
                          const SizedBox(height: 8),
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Configurações',
                            iconName: Icons.settings,
                            route: '/settings',
                            selected: screenId == 2,
                          ),
                          // const SizedBox(height: 8),
                          // MainDrawerNavItemWidget(
                          //   context: context,
                          //   labelText: 'Sign in',
                          //   iconName: Icons.login,
                          //   route: '/sign-in',
                          //   selected: screenId == AppConstants.signInScreenId,
                          // ),
                          // const SizedBox(height: 8),
                          // MainDrawerNavItemWidget(
                          //   context: context,
                          //   labelText: 'Sign up',
                          //   iconName: Icons.create,
                          //   route: '/sign-up',
                          //   selected: screenId == AppConstants.signUpScreenId,
                          // ),
                          const SizedBox(height: 8),
                          MainDrawerNavItemWidget(
                            context: context,
                            labelText: 'Sair do app',
                            iconName: Icons.logout,
                            callback: () => signOut(context),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () =>
                            _launchUrl('mailto:suporte.nutripersonal.com'),
                        child: const Text(
                          "Suporte ",
                          style: TextStyle(color: AppColors.pLight),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => _launchUrl(
                            'https://github.com/NutriPersonal/mobile'),
                        child: const Text(
                          "GitHub ",
                          style: TextStyle(color: AppColors.pLight),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () => _launchUrl(
                            'https://www.instagram.com/nutri.personal.fb/'),
                        child: const Text(
                          "Instagram ",
                          style: TextStyle(color: AppColors.pLight),
                        ),
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

  void signOut(BuildContext context) async {
    await AuthService().signOut();
    context.vRouter.to('/sign-in');
  }

  void _launchUrl(url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
