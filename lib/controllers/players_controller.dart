import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:out_of_context/utils/cache_service.dart';

class PlayersController extends ChangeNotifier {
  List<String> namesList = [];
  List<String> listFromPrefs = [];
  String? name;
  int counter = 0;
  bool isTimerFinished = false;

  void addNameToList({required String name}) async {
    listFromPrefs = CacheService.getStringList(key: 'players') ?? [];
    CacheService.setStringList(key: 'players', value: [...listFromPrefs, name]);
    getListFromPrefs();
    notifyListeners();
  }

  void getListFromPrefs() {
    namesList = CacheService.getStringList(key: 'players') ?? [];
  }

  void removeNameFromList({required int index}) async {
    listFromPrefs = CacheService.getStringList(key: 'players') ?? [];
    listFromPrefs.removeAt(index);
    CacheService.setStringList(key: 'players', value: listFromPrefs);
    getListFromPrefs();
    notifyListeners();
  }

  void shuffleNames() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      counter++;
      if (counter < 500) {
        int randomNum = Random().nextInt(namesList.length);
        name = namesList[randomNum];
        notifyListeners();
      } else {
        timer.cancel();
        String playerOutOfContext = CacheService.getString(key: "outOfContext");
        name = playerOutOfContext;
        isTimerFinished = true;
        notifyListeners();
      }
    });
  }
}
