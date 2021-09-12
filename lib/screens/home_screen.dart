import 'package:flutter/material.dart';
import 'package:quran/utils/constants.dart';
import 'package:quran/widgets/app_name.dart';
import 'package:quran/widgets/home_screen/search_bar.dart';
import 'package:quran/widgets/home_screen/surah_list.dart';
import 'package:quran/widgets/home_screen/tags_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        elevation: 0.0,
        title: AppName(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            SearchBar(),
            SizedBox(height: 25.0),
            TagsSearch(),
            SizedBox(height: 25.0),
            SurahList(),
          ],
        ),
      ),
    );
  }
}
