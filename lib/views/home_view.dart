import 'package:flutter/material.dart';
import 'package:out_of_context/views/add_players_view.dart';

import 'widgets/topic_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopicCard(
            title: 'ملابس',
          ),
          SizedBox(
            width: 30,
          ),
          TopicCard(
            title: 'حيوانات',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AddPlayersView();
                },
              ));
            },
          )
        ],
      )),
    );
  }
}
