import 'package:flutter/material.dart';
import 'package:out_of_context/utils/cache_service.dart';

class PlayersController extends ChangeNotifier {
  List<String>? namesList = [];
  List<String>? listFromPrefs = [];

  void addNameToList({required String name}) async {
    listFromPrefs = CacheService.getStringList(key: 'players');
    CacheService.setStringList(
        key: 'players', value: [...listFromPrefs!, name]);
    getListFromPrefs();
    notifyListeners();
  }

  void getListFromPrefs() {
    namesList = CacheService.getStringList(key: 'players');
  }

  void removeNameFromList({required int index}) async {
    listFromPrefs = CacheService.getStringList(key: 'players');
    listFromPrefs?.removeAt(index);
    CacheService.setStringList(key: 'players', value: listFromPrefs!);
    getListFromPrefs();
    notifyListeners();
  }
}
