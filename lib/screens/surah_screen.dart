import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/model/suraths.dart';
import 'package:quran/utils/constants.dart';

class SurahScreen extends StatelessWidget {
  final Surah surah;

  const SurahScreen({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        elevation: 0.0,
        title: Text(
          surah.surah,
          style: GoogleFonts.nunito(
            color: appDark,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
