import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/utils/app_styles.dart';
import 'package:out_of_context/utils/navigation_service.dart';
import 'package:out_of_context/views/questions_view.dart';
import 'package:out_of_context/views/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int index = 0;
  int page = 0;
  late PlayersController playersController;
  late GameController gameController;
  @override
  void didChangeDependencies() {
    playersController = Provider.of<PlayersController>(context);
    gameController = Provider.of<GameController>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              playersController.namesList[index],
              style: AppStyles.textStyle24,
            ),
            const SizedBox(
              height: 20,
            ),
            gameController.returnWidgetBasedOnPlayer(
                playersController.namesList[index], page),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'التالي',
              onPressed: () {
                if (playersController.namesList.length == index + 1 &&
                    page == playersController.namesList.length * 2 - 1) {
                  navigateWithoutAnimation(context, const QuestionsView());
                } else {
                  page++;
                  if (page % 2 == 0) {
                    index++;
                  }
                  gameController.rebuidUi();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
