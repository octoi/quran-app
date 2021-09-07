import 'package:http/http.dart' as http;
import 'package:quran/model/chapter.dart';

String originUrl = 'https://api.quran.com/api/v4';

Future<List<QuranChapter>> getAllChapters() async {
  Uri url = Uri.parse('$originUrl/chapters');

  http.get(url).then((value) {
    print(value.body);
  });

  return [];
}
