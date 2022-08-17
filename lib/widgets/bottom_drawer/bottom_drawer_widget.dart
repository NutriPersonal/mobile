import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/core/settings/settings_screen.dart';
import 'package:nutripersonal/screens/home/home_screen.dart';
import 'package:nutripersonal/screens/nutritionists/nutritionists_screen.dart';
import 'package:nutripersonal/screens/profile/profile_screen.dart';

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
            screenId == AppConstants.HomeScreenId,
            "Início",
            const HomeScreen(),
            Icons.home,
          ),
          _buildButton(
            context,
            screenId == AppConstants.NutritionistsScreenId,
            "Nutricionistas",
            const NutritionistsScreen(),
            Icons.people_outline,
          ),
          _buildButton(
            context,
            screenId == AppConstants.ProfileScreenId,
            "Perfil",
            const ProfileScreen(),
            Icons.person_outline,
          ),
          _buildButton(
            context,
            screenId == AppConstants.SettingsScreenId,
            "Configurações",
            const SettingsScreen(),
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
    Widget screen,
    IconData icon,
  ) {
    var color =
        selected ? AppConstants.normal.withAlpha(224) : Colors.grey.shade400;

    return Expanded(
      child: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => screen),
          )
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
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
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
