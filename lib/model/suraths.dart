import 'package:flutter/cupertino.dart';
import 'package:quran/api/api.dart';
import 'package:quran/utils/suraths_db.dart';

class Surah {
  int id;
  String surah;
  String simpleName; // name in language selected in api
  String page;
  String origin;
  String verses;
  int verseCount;
  bool isFavorite;

  Surah({
    required this.id,
    required this.surah,
    required this.simpleName,
    required this.page,
    required this.origin,
    required this.verses,
    required this.verseCount,
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
          surah.page.toLowerCase().contains(_searchQuery) ||
          surah.origin.contains(_searchQuery) ||
          surah.verses.toString().toLowerCase().contains(_searchQuery);
    }).toList();
  }

  Future<void> fetchAndSetSurahs() async {
    try {
      var surahsFromDatabase = await getDataFromDatabase();
      _suraths = surahsFromDatabase;

      if (surahsFromDatabase.length == 0) {
        var surahs = await requestAllSurahs();
        _suraths = surahs;
        await saveDataToDatabase(surahs);
      }
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

    Surah _updatedSurah = Surah(
      id: _surah.id,
      surah: _surah.surah,
      simpleName: _surah.simpleName,
      page: _surah.page,
      origin: _surah.origin,
      verses: _surah.verses,
      verseCount: _surah.verseCount,
      isFavorite: isFavorite,
    );

    _suraths[_surahIdx] = _updatedSurah;
    notifyListeners();

    updateFavoriteInDatabase(_updatedSurah);
  }

  Surah getOneSurah(int id) {
    return _suraths.firstWhere((surah) => surah.id == id);
  }
}
