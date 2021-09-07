import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/model/chapter.dart';

String originUrl = 'https://api.quran.com/api/v4';

Future<List<QuranChapter>> getAllChapters() async {
  List<QuranChapter> quranChapters = [];
  Uri url = Uri.parse('$originUrl/chapters');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    decodedData['chapters'].forEach((surah) {
      var newChapter = QuranChapter(
        id: surah['id'],
        surah: surah['name_arabic'],
        simpleName: surah['name_simple'],
        pages: '1-10',
        origin: surah['revelation_place'],
        verses: surah['verses_count'],
      );
      quranChapters.add(newChapter);
    });
  }

  return quranChapters;
}
