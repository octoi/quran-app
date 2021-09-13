import 'package:flutter/cupertino.dart';
import 'package:quran/api/api.dart';

class Surah {
  int id;
  String surah;
  String simpleName; // name in language selected in api
  String pages;
  String origin;
  int verses;
  bool isFavorite;

  Surah({
    required this.id,
    required this.surah,
    required this.simpleName,
    required this.pages,
    required this.origin,
    required this.verses,
    this.isFavorite = false,
  });
}

class Suraths with ChangeNotifier {
  List<Surah> _suraths = [];

  // utilities
  bool haveAnyError = false;
  String _searchQuery = '';

  List<Surah> get suraths {
    if (_searchQuery.trim().length == 0) {
      return [..._suraths];
    }

    return _suraths.where((surah) {
      return surah.simpleName.toLowerCase().contains(_searchQuery) ||
          surah.surah.toLowerCase().contains(_searchQuery) ||
          surah.pages.toLowerCase().contains(_searchQuery) ||
          surah.origin.contains(_searchQuery) ||
          surah.verses.toString().toLowerCase().contains(_searchQuery);
    }).toList();
  }

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

  void search(String newSearchQuery) {
    _searchQuery = newSearchQuery.toLowerCase();
    notifyListeners();
  }
}
