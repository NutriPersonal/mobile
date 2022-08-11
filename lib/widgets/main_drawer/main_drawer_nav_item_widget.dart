import 'package:flutter/material.dart';

class MainDrawerNavItemWidget extends StatelessWidget {
  const MainDrawerNavItemWidget({
    Key? key,
    required this.context,
    required this.labelText,
    required this.iconName,
    required this.screen,
    required this.selected,
  }) : super(key: key);

  final BuildContext context;
  final String labelText;
  final IconData iconName;
  final Widget screen;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    const hoverColor = Color(0x222FC4B2);

    return ListTile(
      onTap: () => {navigateToScreen()},
      selectedTileColor: hoverColor,
      selected: selected,
      leading: Icon(
        iconName,
        color: selected ? Color(0xff289c8e) : Color(0xff2FC4B2),
      ),
      title: Text(
        labelText,
        style: TextStyle(
          color: selected ? Color(0xff289c8e) : Color(0xff2FC4B2),
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

  void navigateToScreen() {
    // TODO: implement go to screen.
    Navigator.push(context, MaterialPageRoute(builder: (builder) => screen));
  }
}
