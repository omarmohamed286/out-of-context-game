import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/utils/cache_service.dart';
import 'package:provider/provider.dart';

import '../../utils/app_styles.dart';
import '../../utils/navigation_service.dart';
import '../add_players_view.dart';
import '../home_view.dart';
import 'custom_button.dart';

class RoundFinishedWidget extends StatelessWidget {
  const RoundFinishedWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var gameController = Provider.of<GameController>(context, listen: false);
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          '! نهاية الجولة',
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          ''' 
تقدرو تكملو لعب او تغيرو اللاعبين
او ترجعو للصفحة الرئيسية
              ''',
          style: AppStyles.textStyle24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 100,
        ),
        CustomButton(
          text: 'كمل لعب',
          onPressed: () {
            gameController.getPlayerOutOfContext();
            gameController.getNewTopic();
            pageController.jumpToPage(1);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          text: 'تغيير اللاعبين',
          onPressed: () {
            navigateWithoutAnimation(context, const AddPlayersView());
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          text: 'العودة للصفحة الرئيسية',
          onPressed: () {
            CacheService.removeData(key: 'results');
            navigateWithoutAnimation(context, const HomeView());
          },
        ),
      ],
    );
  }
}
