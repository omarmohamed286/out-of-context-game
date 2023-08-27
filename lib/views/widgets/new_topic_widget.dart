import 'package:flutter/material.dart';
import 'package:out_of_context/utils/app_styles.dart';
import 'package:out_of_context/utils/navigation_service.dart';
import 'package:out_of_context/views/game_view.dart';
import 'package:out_of_context/views/widgets/custom_button.dart';

class NewTopicWidget extends StatelessWidget {
  const NewTopicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '''
اخترنا ليكم موضوع جديد اضغطوا التالي
عشان تبدأ الجولة
''',
          style: AppStyles.textStyle24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 100,
        ),
        CustomButton(
          text: 'التالي',
          onPressed: () {
            navigateWithoutAnimation(context, const GameView());
          },
        )
      ],
    );
  }
}
