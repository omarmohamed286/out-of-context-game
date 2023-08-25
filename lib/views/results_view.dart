import 'package:flutter/material.dart';
import 'package:out_of_context/utils/app_styles.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

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
            'النتائج',
            style: AppStyles.textStyle32,
          )
        ],
      )),
    );
  }
}
