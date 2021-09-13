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

    if (_searchQuery == 'favorite' || _searchQuery == 'unfavorite') {
      return _suraths
          .where(
            (surah) => _searchQuery == 'favorite'
                ? surah.isFavorite
                : !surah.isFavorite,
          )
          .toList();
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

  void updateFavorite(int id, bool isFavorite) {
    int _surahIdx = _suraths.indexWhere((surah) => surah.id == id);
    Surah _surah = _suraths[_surahIdx];
    _suraths[_surahIdx] = Surah(
      id: _surah.id,
      surah: _surah.surah,
      simpleName: _surah.simpleName,
      pages: _surah.pages,
      origin: _surah.origin,
      verses: _surah.verses,
      isFavorite: isFavorite,
    );

    notifyListeners();
  }
}
