import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/utils/app_styles.dart';
import 'package:out_of_context/utils/navigation_service.dart';
import 'package:out_of_context/views/round_finished_view.dart';
import 'package:out_of_context/views/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import 'widgets/result_card.dart';

class ResultsView extends StatefulWidget {
  const ResultsView({super.key});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  late GameController gameController;

  @override
  void didChangeDependencies() {
    gameController = Provider.of<GameController>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> results = gameController.getResultsMap();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'النتائج',
              style: AppStyles.textStyle32,
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, i) {
                    return ResultCard(
                      gameController: gameController,
                      name: results.keys.toList()[i].toString(),
                      result: results.values.toList()[i].toString(),
                    );
                  },
                )),
            CustomButton(
              text: 'التالي',
              onPressed: () {
                navigateWithoutAnimation(context, const RoundFinishedView());
              },
            )
          ],
        )),
      ),
    );
  }
}
