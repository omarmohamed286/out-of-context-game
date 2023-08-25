import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/views/voting_view.dart';
import 'package:out_of_context/views/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'widgets/vote_card.dart';

class AskingView extends StatefulWidget {
  const AskingView({super.key});

  @override
  State<AskingView> createState() => _AskingViewState();
}

class _AskingViewState extends State<AskingView> {
  late PlayersController playersController;
  late GameController gameController;
  List<String> listAfterEdit = [];

  @override
  void didChangeDependencies() {
    playersController = Provider.of<PlayersController>(context);
    gameController = Provider.of<GameController>(context);
    listAfterEdit = [...playersController.namesList];
    super.didChangeDependencies();
  }

  String? player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
            '''
${player ?? listAfterEdit[0]} اسأل شخص عاوز تسأله او اضغط زر
صوت لو كنتم جاهزين للتصويت علي اللي برا السالفة
''',
            style: AppStyles.textStyle24,
            textAlign: TextAlign.center,
          ),
          Builder(
            builder: (context) {
              listAfterEdit.remove(player ?? listAfterEdit[0]);
              return SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: listAfterEdit.length,
                  itemBuilder: (context, i) {
                    return VoteCard(
                      playerName: listAfterEdit[i],
                      onPressed: () {
                        player = listAfterEdit[i];
                        gameController.rebuidUi();
                      },
                    );
                  },
                ),
              );
            },
          ),
          CustomButton(
            text: 'صوت',
            onPressed: () {
              Navigator.push(
                  context,
                   PageRouteBuilder(
                          pageBuilder: (context, _, __) => VotingView(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero)
                  );
            },
          )
        ],
      ),
    );
  }
}
