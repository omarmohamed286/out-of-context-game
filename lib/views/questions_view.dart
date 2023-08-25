import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/views/asking_view.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'widgets/custom_button.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key});

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  int indexOfPlayer = -1;
  int indexOfWidget = 0;

  @override
  Widget build(BuildContext context) {
    var gameController = Provider.of<GameController>(context);
    var playersController = Provider.of<PlayersController>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'وقت الأسئلة',
              style: AppStyles.textStyle24,
            ),
            SizedBox(
              height: 20,
            ),
            gameController.returnQuestions(indexOfWidget, indexOfPlayer),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'التالي',
              onPressed: () {
                if (indexOfPlayer == playersController.namesList.length - 1) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => AskingView(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero));
                } else {
                  indexOfWidget++;
                  indexOfPlayer++;
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
