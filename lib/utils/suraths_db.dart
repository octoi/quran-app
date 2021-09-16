import 'package:quran/helpers/suraths_db_helper.dart';
import 'package:quran/model/suraths.dart';

Future<List<Surah>> getDataFromDatabase() async {
  List<Surah> _suraths = [];

  try {
    var _databaseData = await SurathsDBHelper.getData();
    _databaseData.forEach((data) {
      _suraths.add(Surah(
        id: int.parse(data['id']),
        surah: data['surah'],
        simpleName: data['simpleName'],
        page: data['page'],
        origin: data['origin'],
        verses: data['verses'],
        verseCount: int.parse(data['verseCount']),
        isFavorite: data['isFavorite'] == 'true',
      ));
    });
  } catch (err) {
    print("[❌] SQLITE DATABASE ERROR \n");
    print(err);
  }

  return _suraths;
}

Future<void> saveDataToDatabase(List<Surah> suraths) async {
  suraths.forEach((surah) {
    SurathsDBHelper.insert({
      'id': surah.id,
      'surah': surah.surah,
      'simpleName': surah.simpleName,
      'page': surah.page,
      'origin': surah.origin,
      'verses': surah.verses.toString(),
      'verseCount': surah.verseCount,
      'isFavorite': surah.isFavorite.toString(),
    });
  });
}

Future<void> updateInDatabase(Surah surah) async {
  SurathsDBHelper.update({
    'id': surah.id,
    'surah': surah.surah,
    'simpleName': surah.simpleName,
    'page': surah.page,
    'origin': surah.origin,
    'verses': surah.verses.toString(),
    'verseCount': surah.verseCount,
    'isFavorite': surah.isFavorite.toString(),
  });
}
