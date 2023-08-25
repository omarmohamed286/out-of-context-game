import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:provider/provider.dart';

import '../controllers/players_controller.dart';
import 'widgets/choose_topic_widget.dart';
import 'widgets/out_of_context_player_widget.dart';

class OutOfContextView extends StatefulWidget {
  const OutOfContextView({super.key});

  @override
  State<OutOfContextView> createState() => _OutOfContextViewState();
}

class _OutOfContextViewState extends State<OutOfContextView> {
  late PlayersController playersController;
  late GameController gameController;

  @override
  void didChangeDependencies() {
    playersController = Provider.of<PlayersController>(context);
    gameController = Provider.of<GameController>(context);
    if (playersController.counter < 500) {
      playersController.shuffleNames();
    }
    super.didChangeDependencies();
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 700,
              width: 500,
              child: PageView(
                controller: pageController,
                children: [
                  OutOfContextPlayerWidget(
                    playersController: playersController,
                    pageController: pageController,
                  ),
                  ChooseTopicWidget(
                    gameController: gameController,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
