import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/utils/colors.dart';
import 'package:quran/widgets/search.dart';
import 'package:quran/widgets/sura_list.dart';
import 'package:quran/widgets/tags_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appPrimaryColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Q',
              style: GoogleFonts.nunito(
                color: appAccentColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'uran',
              style: GoogleFonts.nunito(
                color: appSecondaryColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Search(),
            SizedBox(height: 25.0),
            TagsSearch(),
            SizedBox(height: 25.0),
            SuraList(),
          ],
        ),
      ),
    );
  }
}
