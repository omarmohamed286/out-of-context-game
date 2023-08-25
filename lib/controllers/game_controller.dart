import 'dart:math';

import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/utils/cache_service.dart';

import '../utils/app_styles.dart';

class GameController extends ChangeNotifier {
  final PlayersController playersController;

  GameController(this.playersController);

  String playerOutOfContext = '';

  String currentTopic = '';

  String category = '';

  List<String> animals = [
    'كلب',
    'قطة',
    'فيل',
    'اسد',
    'نمر',
    'ذئب',
    'زرافة',
    'جمل',
    'غزال',
    'قرد',
    'حمار وحشي',
    'حصان',
    'خروف',
    'دجاج',
    'سلحفاة',
    'فار',
    'بقرة',
    'تمساح',
    'دب',
    'ثعلب',
    'خنزير'
  ];

  List<String> clothes = [
    'تيشيرت',
    'بنطلون',
    'حزام',
    'جاكيت',
    'جزمة',
    'كوتشي',
    'شراب',
    'كاب',
    'عباية',
    'نظارة',
    'ساعة'
  ];

  void setCategory({required String mainCategory}) {
    category = mainCategory;
  }

  void getPlayerOutOfContext() {
    playersController.getListFromPrefs();
    var playersList = playersController.namesList;
    int randomNum = Random().nextInt(playersList.length);
    for (int i = 0; i < playersList.length; i++) {
      if (randomNum == i) {
        playerOutOfContext = playersList[i];
        CacheService.setString(key: 'outOfContext', value: playerOutOfContext);
      }
    }
  }

  void getNewTopic() {
    if (category == 'animals') {
      int randomNum = Random().nextInt(animals.length);
      currentTopic = animals[randomNum];
    } else {
      int randomNum = Random().nextInt(clothes.length);
      currentTopic = clothes[randomNum];
    }
    CacheService.setString(key: 'currentTopic', value: currentTopic);
  }

  Widget returnWidgetBasedOnPlayer(String playerName, int page) {
    String topic = category == 'animals' ? 'الحيوانات' : 'الملابس';
    if (page == 0 || page % 2 == 0) {
      return Text(
        '''
ادو التليفون ل$playerName
اضغط التالي عشان تعرف هل انت برا
الموضوع او جوا ومتخليش حد غيرك
يشوف الشاشة
''',
        style: AppStyles.textStyle24,
        textAlign: TextAlign.center,
      );
    }
    if (playerName == playerOutOfContext) {
      return Text(
        '''
انت اللي برا الموضوع! حاول تعرف ايه
الموضوع بالظبط من كلام البقية او
اقنعهم يصوتوا علي الشخص الخطأ
تلميح الموضوع عن $topic
''',
        style: AppStyles.textStyle24,
        textAlign: TextAlign.center,
      );
    }
    return Text(
      '''
انت داخل في الموضوع واللي هو $currentTopic 
هدفك في اللعبة معرفة مين منكم اللي برا الموضوع
اضغط التالي
''',
      style: AppStyles.textStyle24,
      textAlign: TextAlign.center,
    );
  }

  Widget returnQuestions(int indexOfWidget, int indexOfPlayer) {
    int askWho = indexOfPlayer == playersController.namesList.length - 1
        ? 0
        : indexOfPlayer + 1;

    if (indexOfWidget == 0) {
      return Text(
        '''
كل شخص هيسأل شخص ثاني سؤال متعلق بالموضوع
اضغطوا التالي عشان تعرفو مين هيسأل مين
''',
        style: AppStyles.textStyle24,
        textAlign: TextAlign.center,
      );
    }
    return Text(
      '''
${playersController.namesList[indexOfPlayer]} اسأل ${playersController.namesList[askWho]} سؤال
متعلق بالموضوع! اختار سؤالك بعناية عشان اللي برا الموضوع ميعرفش بتتكلمو عن ايه

''',
      style: AppStyles.textStyle24,
      textAlign: TextAlign.center,
    );
  }

  void rebuidUi() {
    notifyListeners();
  }
}
