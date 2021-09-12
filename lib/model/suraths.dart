import 'package:flutter/cupertino.dart';
import 'package:quran/api/api.dart';

class Surah {
  int id;
  String surah;
  String simpleName; // name in language selected in api
  String pages;
  String origin;
  int verses;

  Surah({
    required this.id,
    required this.surah,
    required this.simpleName,
    required this.pages,
    required this.origin,
    required this.verses,
  });
}

class Suraths with ChangeNotifier {
  List<Surah> _suraths = [];
  bool haveAnyError = false;

  List<Surah> get suraths => [..._suraths];

  Future<void> fetchAndSetSurahs() async {
    try {
      var surahs = await requestAllSurahs();
      _suraths = surahs;
    } catch (e) {
      print(e);
      haveAnyError = true;
    }

    notifyListeners();
    return;
  }
}
