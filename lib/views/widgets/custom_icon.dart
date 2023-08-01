import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.onTap, required this.icon, required this.size});

  final void Function()? onTap;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: size,
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
