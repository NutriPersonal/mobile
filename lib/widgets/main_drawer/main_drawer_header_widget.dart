import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';

class MainDrawerHeaderWidget extends StatelessWidget {
  const MainDrawerHeaderWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.urlImage,
  }) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final String name;
  final String email;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding.add(const EdgeInsets.only(top: 55, bottom: 55)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(urlImage),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: "Courgette",
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.pLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
