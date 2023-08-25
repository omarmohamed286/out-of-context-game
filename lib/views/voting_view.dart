import 'package:flutter/material.dart';
import 'package:out_of_context/views/out_of_context_view.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
import '../controllers/players_controller.dart';
import '../utils/app_styles.dart';
import 'widgets/vote_card.dart';

class VotingView extends StatefulWidget {
  const VotingView({super.key});

  @override
  State<VotingView> createState() => _VotingViewState();
}

class _VotingViewState extends State<VotingView> {
  late PlayersController playersController;
  late GameController gameController;
  List<String> listAfterEdit = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    playersController = Provider.of<PlayersController>(context);
    gameController = Provider.of<GameController>(context);
    listAfterEdit = [...playersController.namesList];
    super.didChangeDependencies();
  }

  int numberOfVotes = 0;

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
 ${listAfterEdit[numberOfVotes]} اختار الشخص اللي تظن انه برا 
السالفة!
''',
            style: AppStyles.textStyle24,
            textAlign: TextAlign.center,
          ),
          Builder(
            builder: (context) {
              listAfterEdit.remove(listAfterEdit[numberOfVotes]);
              return SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: listAfterEdit.length,
                  itemBuilder: (context, i) {
                    return VoteCard(
                      playerName: listAfterEdit[i],
                      onPressed: () {
                        if (numberOfVotes ==
                            playersController.namesList.length - 1) {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, _, __) =>
                                      OutOfContextView(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero));
                        } else {
                          numberOfVotes++;
                          gameController.rebuidUi();
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
