import 'dart:math';

import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/players_controller.dart';

import '../utils/app_styles.dart';

class GameController extends ChangeNotifier {
  final PlayersController playersController;

  GameController(this.playersController);

  String playerOutOfContext = '';

  String getPlayerOutOfContext() {
    playersController.getListFromPrefs();
    var playersList = playersController.namesList!;
    int randomNum = Random().nextInt(playersList.length);
    for (int i = 0; i < playersList.length; i++) {
      if (randomNum == i) {
        playerOutOfContext = playersList[i];
      }
    }
    return playerOutOfContext;
  }

  Widget returnWidgetBasedOnPlayer(String playerName, int index,int page) {
    if (page == 0 || page % 2 == 0) {
      return Text(
        '''
ادو الجوال ل$playerName
اضغط التالي حتي تعرف هل انت برا
السالفة او داخلها ولا تخلي احد غيرك
يشوف الشاشة
''',
        style: AppStyles.textStyle24,
        textAlign: TextAlign.center,
      );
    }
    if (playerName == playerOutOfContext) {
      return Text(
        '''
انت اللي برا السالفة! حاول تعرف وش
السالفة بالضبط من كلام البقية او
اقنعهم يصوتون علي الشخص الخطأ
تلميح السالفة عن الحيوانات
''',
        style: AppStyles.textStyle24,
        textAlign: TextAlign.center,
      );
    }
    return Text(
      '''
انت داخل في السالفة واللي هي ضب 
هدفك في اللعبة معرفة مين منكم اللي برا السالفة
اضغط التالي
''',
      style: AppStyles.textStyle24,
      textAlign: TextAlign.center,
    );
  }

  void rebuidUi() {
    notifyListeners();
  }
}
