import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class ChoosingCard extends StatelessWidget {
  const ChoosingCard({super.key, required this.text, this.onTap, required this.color});

  final String text;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 50,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16)),
            child: Text(text,
                style: AppStyles.textStyle24.copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
