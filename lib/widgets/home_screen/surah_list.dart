import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran/model/suraths.dart';
import 'package:quran/screens/surah_screen.dart';
import 'package:quran/utils/constants.dart';
import 'package:quran/widgets/home_screen/like_button.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Suraths>(context, listen: false).fetchAndSetSurahs(),
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return SkeletonLoader(
            baseColor: Colors.grey.shade100,
            highlightColor: appWhite,
            items: 10,
            builder: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 80,
            ),
          );
        } else {
          return Consumer<Suraths>(
            builder: (ctx, surathsData, _) {
              return Column(
                children: surathsData.suraths.map((surah) {
                  return SuraCard(
                    key: ValueKey(surah.id),
                    surah: surah,
                  );
                }).toList(),
              );
            },
          );
        }
      },
    );
  }
}

class SuraCard extends StatelessWidget {
  final Surah surah;

  const SuraCard({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(10.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (BuildContext context) {
            return SurahScreen(surah: surah);
          }),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.surah,
                    style: GoogleFonts.nunito(
                      color: appDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'page: ${surah.page}, verses: ${surah.verseCount}',
                    style: GoogleFonts.nunito(
                      color: appGray,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              LikeButton(surah: surah),
            ],
          ),
        ),
      ),
    );
  }
}
