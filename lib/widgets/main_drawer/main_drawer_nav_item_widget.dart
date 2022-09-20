import 'package:flutter/material.dart';
import 'package:nutripersonal/constants/app_colors.dart';
import 'package:vrouter/vrouter.dart';

class MainDrawerNavItemWidget extends StatelessWidget {
  const MainDrawerNavItemWidget({
    Key? key,
    required this.context,
    required this.labelText,
    required this.iconName,
    this.route,
    this.selected,
    this.callback,
  }) : super(key: key);

  final BuildContext context;
  final String labelText;
  final IconData iconName;
  final String? route;
  final bool? selected;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    var hoverColor = AppColors.pLighter.withAlpha(90);

    return ListTile(
      onTap: route != null
          ? () => {context.vRouter.to(route!)}
          : (callback ?? () => {}),
      selectedTileColor: hoverColor,
      selected: selected != null && selected == true,
      leading: Icon(
        iconName,
        color: selected != null && selected == true
            ? AppColors.pDark
            : AppColors.primary,
      ),
      title: Text(
        labelText,
        style: TextStyle(
          color: selected != null && selected == true
              ? AppColors.pDark
              : AppColors.primary,
          fontSize: 18,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(5),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
          // bottomLeft: Radius.circular(5),
        ),
      ),
    );
  }
}
