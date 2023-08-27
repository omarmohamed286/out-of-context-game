import 'package:flutter/material.dart';
import 'package:out_of_context/views/widgets/new_topic_widget.dart';

import 'widgets/round_finished_widget.dart';

class RoundFinishedView extends StatefulWidget {
  const RoundFinishedView({super.key});

  @override
  State<RoundFinishedView> createState() => _RoundFinishedViewState();
}

class _RoundFinishedViewState extends State<RoundFinishedView> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 700,
              width: 500,
              child: PageView(
                controller: pageController,
                children: [
                  RoundFinishedWidget(
                    pageController: pageController,
                  ),
                  NewTopicWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
