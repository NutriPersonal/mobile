import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:nutripersonal/constants/app_constants.dart';
import 'package:nutripersonal/constants/assets_paths.dart';

class MainDrawerHeaderWidget extends StatelessWidget {
  const MainDrawerHeaderWidget({
    Key? key,
    required this.name,
    required this.email,
    required this.urlImage,
  }) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final String? name;
  final String? email;
  final String? urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding.add(const EdgeInsets.only(top: 55, bottom: 55)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl: urlImage ?? '',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AppAssets.iconUser),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name ?? 'Usuário',
            style: const TextStyle(
              fontSize: 24,
              fontFamily: "Courgette",
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            email ?? '',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.pLight,
            ),
          ),
        ],
      ),
    );
  }
}
