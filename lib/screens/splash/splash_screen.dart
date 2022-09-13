import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/assets_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: AppColors.primary,
      child: Image(
        image: AssetImage(AppAssets.logotypeWhite),
        width: 250,
      ),
    );
  }
}
