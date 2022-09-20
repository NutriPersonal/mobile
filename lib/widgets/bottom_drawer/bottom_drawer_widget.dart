import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/core/settings/settings_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/screens/nutritionists/nutritionists_screen.dart';
import 'package:nutripersonal/screens/profile/profile_screen.dart';
import 'package:vrouter/vrouter.dart';

class BottomDrawerWidget extends StatelessWidget {
  const BottomDrawerWidget({Key? key, required this.screenId})
      : super(key: key);

  final int screenId;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white38,
      // color: Colors.transparent,
      child: Row(
        children: [
          _buildButton(
            context,
            screenId == AppConstants.homeScreenId,
            "Início",
            '/home',
            Icons.home,
          ),
          _buildButton(
            context,
            screenId == AppConstants.nutritionistsScreenId,
            "Nutricionistas",
            '/nutritionists',
            Icons.people_outline,
          ),
          _buildButton(
            context,
            screenId == AppConstants.profileScreenId,
            "Perfil",
            '/profile',
            Icons.person_outline,
          ),
          _buildButton(
            context,
            screenId == AppConstants.settingsScreenId,
            "Configurações",
            '/settings',
            Icons.settings_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    bool selected,
    String label,
    String route,
    IconData icon,
  ) {
    var color = selected ? AppColors.primary : Colors.grey.shade400;

    return Expanded(
      child: InkWell(
        onTap: () => {
          context.vRouter.to(route)
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 18,
              ),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
