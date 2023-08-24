import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/players_controller.dart';
import '../utils/app_styles.dart';

class OutOfContextView extends StatefulWidget {
  const OutOfContextView({super.key});

  @override
  State<OutOfContextView> createState() => _OutOfContextViewState();
}

class _OutOfContextViewState extends State<OutOfContextView> {
  late PlayersController playersController;

  @override
  void didChangeDependencies() {
    playersController = Provider.of<PlayersController>(context);
    if (playersController.counter < 500) {
      playersController.shuffleNames();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              '... الشخص اللي برا السالفة هو',
              style: AppStyles.textStyle24,
            ),
            SizedBox(
              height: 60,
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
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
