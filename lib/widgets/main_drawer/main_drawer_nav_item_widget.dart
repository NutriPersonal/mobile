import 'package:flutter/material.dart';

class MainDrawerNavItemWidget extends StatelessWidget {
  const MainDrawerNavItemWidget({
    Key? key,
    required this.context,
    required this.labelText,
    required this.iconName,
    required this.screen,
  }) : super(key: key);

  final BuildContext context;
  final String labelText;
  final IconData iconName;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    const color = Colors.grey;
    const hoverColor = Colors.blueGrey;

    return ListTile(
      onTap: () => {navigateToScreen()},
      hoverColor: hoverColor,
      leading: Icon(
        iconName,
        color: Colors.grey,
      ),
      title: Text(
        labelText,
        style: const TextStyle(
          color: color,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
    );
  }

  void navigateToScreen() {
    // TODO: implement go to screen.
    Navigator.push(context, MaterialPageRoute(builder: (builder) => screen));
  }
}
