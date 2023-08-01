import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(18)),
      child: Text(
        text,
        style: AppStyles.textStyle24,
      ),
    );
  }
}
