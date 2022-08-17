import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_constants.dart';

class BottomDrawerWidget extends StatelessWidget {
  const BottomDrawerWidget({Key? key, required this.screenId})
      : super(key: key);

  final int screenId;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          _buildButton(
            screenId == AppConstants.HomeScreenId,
            "Início",
            () {},
            Icons.home,
          ),
          _buildButton(
            screenId == 4,
            "Nutricionistas",
            () {},
            Icons.people_outline,
          ),
          _buildButton(
            screenId == 5,
            "Perfil",
            () {},
            Icons.person_outline,
          ),
          _buildButton(
            screenId == 6,
            "Configurações",
            () {},
            Icons.settings_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    bool selected,
    String label,
    VoidCallback onTap,
    IconData icon,
  ) {
    var color =
        selected ? AppConstants.normal.withAlpha(224) : Colors.grey.shade400;

    return Expanded(
      child: InkWell(
        onTap: onTap,
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
