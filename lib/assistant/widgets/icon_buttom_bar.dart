import 'package:flutter/material.dart';

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.iconSize = 28,
    this.secondIconSize = 26,
  });

  final IconData icon;
  final bool selected;

  final Function() onPressed;
  final double iconSize;
  final double secondIconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onPressed,
      child: Icon(
        icon,
        color: selected ? Color.fromARGB(255, 1, 152, 84) : Colors.black,
        size: 30,
      ),
    );
  }
}
