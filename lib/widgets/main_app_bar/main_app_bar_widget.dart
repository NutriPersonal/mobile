import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('NutriPersonal'),
      elevation: 0,
      backgroundColor: AppColors.primary,
      titleSpacing: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: AppColors.pLight,
        fontFamily: "Courgette",
      ),
    );
  }
}
