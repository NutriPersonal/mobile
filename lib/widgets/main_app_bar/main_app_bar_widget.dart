import 'package:flutter/material.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('NutriPersonal'),
      elevation: 0,
      backgroundColor: const Color(0xff2FC4B2),
      titleSpacing: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: Color(0xff8DE5DB),
      ),
    );
  }
}
