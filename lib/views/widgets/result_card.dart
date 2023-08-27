import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/utils/app_styles.dart';

class ResultCard extends StatelessWidget {
  const ResultCard(
      {super.key,
      required this.gameController,
      required this.name,
      required this.result});

  final GameController gameController;
  final String name;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: AppStyles.textStyle24,
            ),
            SizedBox(
              width: 100,
            ),
            Text(result, style: AppStyles.textStyle24),
          ],
        ),
      ),
    );
  }
}
