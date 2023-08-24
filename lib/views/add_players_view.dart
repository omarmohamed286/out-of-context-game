import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
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
    var controller = Provider.of<PlayersController>(context);
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
                    itemCount: controller.namesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PlayerNameCard(
                          name: controller.namesList[index],
                          onTap: () {
                            controller.removeNameFromList(index: index);
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
                      onPressed: controller.namesList.length < 3
                          ? null
                          : () {
                              Provider.of<GameController>(context,
                                      listen: false)
                                  .getPlayerOutOfContext();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameView(),
                                ),
                              );
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
