import 'package:flutter/material.dart';
import 'package:out_of_context/views/results_view.dart';

import '../../controllers/game_controller.dart';
import '../../utils/app_styles.dart';
import '../../utils/cache_service.dart';
import 'choosing_card.dart';

class ChooseTopicWidget extends StatefulWidget {
  const ChooseTopicWidget({super.key, required this.gameController});

  final GameController gameController;

  @override
  State<ChooseTopicWidget> createState() => _ChooseTopicWidgetState();
}

class _ChooseTopicWidgetState extends State<ChooseTopicWidget> {
  late List<String> options = widget.gameController.getListOfOptions();
  late List<Color> topicsColors =
      List.generate(options.length, (index) => Colors.deepOrangeAccent);
  String outOfContextPlayer = CacheService.getString(key: 'outOfContext');
  String topic = CacheService.getString(key: 'currentTopic');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '$outOfContextPlayer ايه هو الموضوع؟',
            style: AppStyles.textStyle24,
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, i) {
                return ChoosingCard(
                  text: options[i],
                  color: topicsColors[i],
                  onTap: () {
                    if (options[i] == topic) {
                      correctTopicChange(i);
                    } else {
                      incorrectTopicChange(i);
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void incorrectTopicChange(int i) {
    topicsColors[i] = Colors.red;
    topicsColors[options.indexOf(topic)] = Colors.green;
    widget.gameController.rebuidUi();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) => const ResultsView(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
  }

  void correctTopicChange(int i) {
    topicsColors[i] = Colors.green;
    widget.gameController.rebuidUi();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) => const ResultsView(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero));
    });
  }
}
