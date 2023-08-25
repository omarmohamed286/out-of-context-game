import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/utils/navigation_service.dart';
import 'package:out_of_context/views/game_view.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_dialog.dart';
import 'widgets/custom_icon.dart';
import 'widgets/player_name_card.dart';

class AddPlayersView extends StatefulWidget {
  const AddPlayersView({super.key});

  @override
  State<AddPlayersView> createState() => _AddPlayersViewState();
}

class _AddPlayersViewState extends State<AddPlayersView> {
  @override
  void didChangeDependencies() {
    Provider.of<PlayersController>(context).getListFromPrefs();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var playersController = Provider.of<PlayersController>(context);
    var gameController = Provider.of<GameController>(context, listen: false);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'تقدر تضيف لاعبين زيادة او تبدأ اللعب بالضغط علي التالي',
                  style: AppStyles.textStyle24,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: playersController.namesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlayerNameCard(
                          name: playersController.namesList[index],
                          onTap: () {
                            playersController.removeNameFromList(index: index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(
                      icon: Icons.person_add,
                      size: 32,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomDialog();
                          },
                        );
                      },
                    ),
                    CustomButton(
                      text: 'التالي',
                      onPressed: playersController.namesList.length < 3
                          ? null
                          : () {
                              gameController.getPlayerOutOfContext();
                              gameController.getNewTopic();
                              navigateWithoutAnimation(
                                  context, const GameView());
                            },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
