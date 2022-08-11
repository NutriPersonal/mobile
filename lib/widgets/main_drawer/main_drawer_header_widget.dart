import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: () => {},
      child: Container(
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
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff289c8e),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0x442FC4B2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
