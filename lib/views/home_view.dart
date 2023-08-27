import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/utils/cache_service.dart';
import 'package:out_of_context/utils/navigation_service.dart';
import 'package:out_of_context/views/add_players_view.dart';
import 'package:provider/provider.dart';

import 'widgets/topic_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GameController gameController;

  @override
  void didChangeDependencies() {
    gameController = Provider.of<GameController>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopicCard(
            title: 'ملابس',
            onTap: () {
              gameController.setCategory(mainCategory: 'clothes');
              navigateWithAnimation(context, const AddPlayersView());
            },
          ),
          SizedBox(
            width: 30,
          ),
          TopicCard(
            title: 'حيوانات',
            onTap: () {
              gameController.setCategory(mainCategory: 'animals');
              navigateWithAnimation(context, const AddPlayersView());
            },
          )
        ],
      )),
    );
  }
}
