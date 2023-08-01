import 'package:flutter/material.dart';
import 'package:out_of_context/views/widgets/custom_icon.dart';

import '../../utils/app_styles.dart';

class PlayerNameCard extends StatelessWidget {
  const PlayerNameCard({super.key, required this.name, this.onTap});

  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          icon: Icons.remove,
          onTap: onTap,
          size: 24,
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          name,
          style: AppStyles.textStyle24,
        ),
      ],
    );
  }
}
