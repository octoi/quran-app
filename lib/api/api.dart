import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/model/suraths.dart';

String originUrl = 'https://api.quran.com/api/v4';

Future<List<Surah>> requestAllSurahs() async {
  List<Surah> _surahs = [];

  Uri url = Uri.parse('$originUrl/chapters');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    decodedData['chapters'].forEach((surah) {
      var newSurah = Surah(
        id: surah['id'],
        surah: surah['name_arabic'],
        simpleName: surah['name_simple'],
        page: '${surah['pages'][0]}',
        origin: surah['revelation_place'],
        verses: '',
        verseCount: surah['verses_count'],
      );
      _surahs.add(newSurah);
    });
  }

  return _surahs;
}

Future<String> requestOneSurah(int id) async {
  String _ayaths = '';

  Uri url = Uri.parse('$originUrl/quran/verses/indopak?chapter_number=$id');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    decodedData['verses'].forEach((verse) {
      _ayaths += '${verse['text_indopak']},';
    });
  }

  return _ayaths;
}
