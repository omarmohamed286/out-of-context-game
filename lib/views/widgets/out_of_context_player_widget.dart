import 'package:flutter/material.dart';

import '../../controllers/players_controller.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class OutOfContextPlayerWidget extends StatelessWidget {
  const OutOfContextPlayerWidget(
      {super.key,
      required this.playersController,
      required this.pageController});

  final PlayersController playersController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '... الشخص اللي برا السالفة هو',
          style: AppStyles.textStyle24,
        ),
        SizedBox(
          height: 150,
        ),
        AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 2),
          child: Text(
            playersController.name ?? playersController.namesList[0],
            style: AppStyles.textStyle24.copyWith(
                fontSize: playersController.isTimerFinished ? 50 : 24),
          ),
        ),
        SizedBox(
          height: 150,
        ),
        CustomButton(
          text: 'التالي',
          onPressed: () {
            pageController.jumpToPage(1);
          },
        )
      ],
    );
  }
}
