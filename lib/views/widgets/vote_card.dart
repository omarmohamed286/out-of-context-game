import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class VoteCard extends StatelessWidget {
  const VoteCard({super.key, required this.playerName, this.onPressed});

  final String playerName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
        ),
        child: Text(
          playerName,
          style: AppStyles.textStyle24,
        ),
      ),
    );
  }
}
